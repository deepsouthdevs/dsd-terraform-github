# # Extending further to handle team permissions
# locals {
#   repositories = {
#     NebulaFusion = {
#       description = "Your cosmic hub for seamless team collaboration and project management"
#       #   teams = ["NebulaFusion-DevTeam"]
#       teams = {
#         NebulaFusion-DevTeam = "push"
#       }
#     },

#     CosmicCanvas = {
#       description = "Where NebulaFusion's limitless potential takes shape in pixels and code"
#       teams = {
#         CosmicCanvas-DevTeam = "push"
#         NebulaFusion-DevTeam = "pull"
#       }
#     }
#   }

#   teams = {
#     CosmicCanvas-DevTeam = {
#       description = "The cosmic creators behind the digital universe of NebulaFusion"
#     }
#     NebulaFusion-DevTeam = {
#       description = "The development powerhouse behind NebulaFusion, driving innovation in cosmic collaboration"
#     }
#   }

#   repository_links = flatten([
#     for repo_name, repo_object in local.repositories : [
#       # teams is now a map so we can loop with k, v, where team_name is the key and the repo permission is the value
#       for team_name, team_permission in repo_object["teams"] :
#       {
#         repository_name = repo_name
#         team_name       = team_name
#         team_permission = team_permission
#       }
#     ]
#   ])

#   # The above will output
#   # repository_links = [
#   #   {
#   #     repository_name = "CosmicCanvas"
#   #     team_name       = "CosmicCanvas-DevTeam"
#   #     team_permission = "push"
#   #   },
#   #   {
#   #     repository_name = "CosmicCanvas"
#   #     team_name       = "NebulaFusion-DevTeam"
#   #     team_permission = "pull"
#   #   },
#   #   {
#   #     repository_name = "NebulaFusion"
#   #     team_name       = "NebulaFusion-DevTeam"
#   #     team_permission = "push"
#   #   },
#   # ]
#   repository_link_map = {
#     for link_map in local.repository_links :
#     "${link_map.repository_name}-${link_map.team_name}" => link_map
#   }
# }

# resource "github_repository" "this" {
#   for_each    = local.repositories
#   name        = each.key
#   description = each.value.description
# }

# resource "github_team" "this" {
#   for_each    = local.teams
#   name        = each.key
#   description = each.value.description
#   privacy     = "closed"
# }

# resource "github_team_repository" "this" {
#   #   You can use for_each inline to index the list
#   #   for_each = {
#   #     for link_map in local.repository_links :
#   #     "${link_map.repository_name}-${link_map.team_name}" => link_map
#   #   }
#   for_each   = local.repository_link_map
#   repository = each.value.repository_name
#   team_id    = github_team.this[each.value.team_name].id
#   permission = each.value.team_permission # It now comes from the map
# }
