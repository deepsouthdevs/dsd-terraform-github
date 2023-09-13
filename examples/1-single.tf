# # CosmicCanvas
# resource "github_repository" "CosmicCanvas" {
#   name        = "CosmicCanvas"
#   description = "Your cosmic hub for seamless team collaboration and project management"
# }

# resource "github_team" "CosmicCanvas-DevTeam" {
#   name        = "CosmicCanvas-DevTeam"
#   description = "The development powerhouse behind NebulaFusion, driving innovation in cosmic collaboration"
#   privacy     = "closed"
# }

# resource "github_team_repository" "CosmicCanvas-Dev-link" {
#   repository = github_repository.CosmicCanvas.name
#   team_id    = github_team.CosmicCanvas-DevTeam.id
#   permission = "push"
# }

# # NebulaFusion
# resource "github_repository" "NebulaFusion" {
#   name        = "NebulaFusion"
#   description = "Your cosmic hub for seamless team collaboration and project management"
# }

# resource "github_team" "NebulaFusion-DevTeam" {
#   name        = "NebulaFusion-DevTeam"
#   description = "The development powerhouse behind NebulaFusion, driving innovation in cosmic collaboration"
#   privacy     = "closed"
# }

# resource "github_team_repository" "NebulaFusion-NebulaFusion-Dev-link" {
#   repository = github_repository.NebulaFusion.name
#   team_id    = github_team.NebulaFusion-DevTeam.id
#   permission = "push"
# }

# # Link to CosmicCanvas
# resource "github_team_repository" "CosmicCanvas-NebulaFusion-Dev-link" {
#   repository = github_repository.CosmicCanvas.name
#   team_id    = github_team.NebulaFusion-DevTeam.id
#   permission = "push"
# }
