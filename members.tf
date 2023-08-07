locals {
  members_list = distinct(flatten([
    for member in var.members : [
      for squad_roles, team_roles in member["squad_role"] : {
        username   = member["username"]
        team_role  = team_roles
        squad_role = squad_roles
      }
    ]
  ]))

  filtered_members = {
    for entry in local.members_list :
    "${entry.username}.${entry.team_role}.${entry.squad_role}" => entry
    if contains(["active"], data.github_membership.this[entry.username].state)
  }
}

data "github_membership" "this" {
  for_each     = { for entry in var.members : "${entry.username}" => entry }
  username     = each.value.username
  organization = var.github_org
}

resource "github_team_membership" "team_membership" {
  for_each = local.filtered_members

  team_id  = github_team.squad_roles[each.value.squad_role].id
  username = each.value.username
  role     = each.value.team_role
}
