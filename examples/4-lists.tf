# # Working with lists
# locals {
#   # index-by
#   index-by = {
#     for link_map in local.repository_links :
#     "${link_map.repository_name}-${link_map.team_name}" => link_map
#   }

#   # filter
#   filter-by = {
#     for link_map in local.repository_links :
#     "${link_map.repository_name}-${link_map.team_name}" => link_map
#     if link_map.team_permission == "pull"
#   }

#   # group-by
#   group-by = {
#     for link_map in local.repository_links :
#     "${link_map.team_permission}" => link_map... # ellipses does the group-by
#   }
# }

# output "index-by" {
#   value = local.index-by
# }

# output "filter-by" {
#   value = local.filter-by
# }

# output "group-by" {
#   value = local.group-by
# }
