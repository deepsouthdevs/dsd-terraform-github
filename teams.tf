resource "github_team" "parent" {
  for_each = { for entry in var.parent : "${entry.name}" => entry }

  name        = each.value.name
  description = each.value.description
  privacy     = each.value.privacy
}

# resource "github_team" "child" {
#   depends_on = [github_team.parent]
#   for_each   = { for entry in var.child : "${entry.name}" => entry }

#   name           = each.value.name
#   description    = each.value.description
#   privacy        = each.value.privacy
#   parent_team_id = each.value.parent_team == "" ? null : github_team.parent[each.value.parent_team].id
# }

resource "github_team" "squad_roles" {
  depends_on = [github_team.parent]
  for_each   = { for entry in var.squad_roles : "${entry.name}" => entry }

  name           = each.value.name
  description    = each.value.description
  privacy        = each.value.privacy
  parent_team_id = github_team.parent[each.value.parent_team].id
}
