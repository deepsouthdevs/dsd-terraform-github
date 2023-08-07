output "filtered-members" {
  value = local.filtered_members
}

output "excluded-members" {
  value = {
    for entry in local.members_list :
    "${entry.username}.${entry.team_role}.${entry.squad_role}" => entry
    if !contains(["admin", "member"], data.github_membership.this[entry.username].role)
  }
}

output "membership-status" {
  value = data.github_membership.this
}
