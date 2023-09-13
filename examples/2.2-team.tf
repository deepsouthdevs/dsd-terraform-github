# locals {
#   teams = {
#     CosmicCanvas = {
#       description = "Where NebulaFusion's limitless potential takes shape in pixels and code"
#     }
#     NebulaFusion-DevTeam = {
#       description = "The development powerhouse behind NebulaFusion, driving innovation in cosmic collaboration"
#     }
#   }
# }

# resource "github_team" "this" {
#   for_each    = local.teams
#   name        = each.key
#   description = each.value.description
#   privacy     = "closed"
# }
