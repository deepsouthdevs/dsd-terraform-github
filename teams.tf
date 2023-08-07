resource "github_team" "parent" {
  for_each = { for team in var.parent_teams : "${team.name}" => team }

  name        = each.value.name
  description = each.value.description
  privacy     = each.value.privacy
}

resource "github_team" "team" {
  depends_on = [github_team.parent]
  for_each   = { for team in var.teams : "${team.name}" => team }

  name           = each.value.name
  description    = each.value.description
  privacy        = each.value.privacy
  parent_team_id = github_team.parent[each.value.parent_team].id
}
