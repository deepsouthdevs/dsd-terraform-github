# locals {
#   repositories = {
#     NebulaFusion = {
#       description = "Your cosmic hub for seamless team collaboration and project management"
#     }
#   }
# }

# resource "github_repository" "this" {
#   for_each = {
#     NebulaFusion = {
#       description = "Your cosmic hub for seamless team collaboration and project management"
#     }
#   }
#   name        = each.key
#   description = each.value.description
# }

# # resource "github_repository" "this" {
# #   for_each    = local.repositories
# #   name        = each.key
# #   description = each.value.description
# # }

# # resource "github_team" "NebulaFusion-DevTeam" {
# #   name        = "NebulaFusion-DevTeam"
# #   description = "The development powerhouse behind NebulaFusion, driving innovation in cosmic collaboration"
# #   privacy     = "closed"
# # }

# # resource "github_team_repository" "NebulaFusion-Dev-link" {
# #   repository = github_repository.NebulaFusion.name
# #   team_id    = github_team.NebulaFusion-DevTeam.id
# #   permission = "push"
# # }
