locals {
  repository_roles = flatten([
    for repo in var.repositories : [
      for role_name, permission in repo["repository_role"] : {
        repository_name = repo["repository_name"]
        role_name       = role_name
        permission      = permission
      }
    ]
  ])

  # global_roles = distinct(flatten([
  #   for repo in var.repositories : [
  #     for role in var.global_permissions : [
  #       for role_name, permission in role["repository_role"] : {
  #         repository_name = repo.repository_name
  #         role_name       = role_name
  #         permission      = permission
  #       }
  #     ]
  #   ]
  # ]))

  all_roles = distinct(
    flatten(
      concat(
        # local.global_roles,
        local.repository_roles
      )
    )
  )
}

resource "github_team_repository" "repository_team_permissions" {
  depends_on = [github_team.squad_roles]
  for_each = {
    for index, role_map in local.all_roles :
    "${role_map.repository_name}-${role_map.role_name}-${role_map.permission}" => role_map
  }

  repository = each.value.repository_name
  team_id    = each.value.role_name
  permission = each.value.permission
}
