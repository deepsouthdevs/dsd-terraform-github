# locals {
#   members = [
#     {
#       "username" = "",
#       "teams"    = []
#     }
#   ]
# }

# resource "github_membership" "this" {
#   for_each = { for entry in local.members : "${entry.username}" => entry }
#   username = each.value.username
#   role     = "member"
# }
