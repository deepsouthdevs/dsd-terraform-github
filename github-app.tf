locals {
  repository_links = flatten([
    for repo_object in var.repositories : [
      for team_name, team_permission in repo_object["teams"] :
      {
        repository_name = repo_object["name"]
        team_name       = team_name
        team_permission = team_permission
      }
    ]
  ])

  repository_link_map = {
    for link_map in local.repository_links :
    "${link_map.repository_name}-${link_map.team_name}" => link_map
  }
}

resource "github_repository" "this" {
  for_each = {
    for team in var.repositories :
    team["name"] => team
  }
  name        = each.key
  description = each.value.description
}

resource "github_team" "this" {
  for_each = {
    for team in var.teams :
    team["name"] => team
  }
  name        = each.key
  description = each.value.description
  privacy     = "closed"
}

resource "github_team_repository" "this" {
  for_each   = local.repository_link_map
  repository = each.value.repository_name
  team_id    = github_team.this[each.value.team_name].id
  permission = each.value.team_permission
}
