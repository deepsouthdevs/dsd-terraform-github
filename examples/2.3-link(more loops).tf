# # Nested loops in terraform
# locals {
#   # repositories = map(object({
#   #   description = string
#   #   teams       = list(string)
#   # }))
#   repositories = {
#     NebulaFusion = {
#       description = "Your cosmic hub for seamless team collaboration and project management"
#       teams       = ["NebulaFusion-DevTeam"]
#     },

#     CosmicCanvas = {
#       description = "Where NebulaFusion's limitless potential takes shape in pixels and code"
#       teams       = ["CosmicCanvas-DevTeam", "NebulaFusion-DevTeam"]
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


#   # We need one link per team per repository

#   # # CosmicCanvas
#   # resource "github_team_repository" "CosmicCanvas-CosmicCanvas-DevTeam" {
#   #   repository = "CosmicCanvas"
#   #   team_id    = "CosmicCanvas-DevTeam"
#   #   permission = "push"
#   # }
#   # resource "github_team_repository" "CosmicCanvas-NebulaFusion-DevTeam" {
#   #   repository = "CosmicCanvas"
#   #   team_id    = "NebulaFusion-DevTeam"
#   #   permission = "push"
#   # }

#   # # NebulaFusion
#   # resource "github_team_repository" "NebulaFusion-NebulaFusion-DevTeam" {
#   #   repository = "NebulaFusion"
#   #   team_id    = "NebulaFusion-DevTeam"
#   #   permission = "push"
#   # }

#   #   repository_links = flatten([
#   #     for repo_name, repo_object in local.repositories : [
#   #       for team_name in repo_object["teams"] :
#   #       {
#   #         repository_name = repo_name
#   #         team_name       = team_name
#   #       }
#   #     ]
#   #   ])

#   # The above will output
#   # repository_links = [
#   #   {
#   #     repository_name = "CosmicCanvas"
#   #     team_name       = "CosmicCanvas-DevTeam"
#   #   },
#   #   {
#   #     repository_name = "CosmicCanvas"
#   #     team_name       = "NebulaFusion-DevTeam"
#   #   },
#   #   {
#   #     repository_name = "NebulaFusion"
#   #     team_name       = "NebulaFusion-DevTeam"
#   #   }
#   # ]
#   #   repository_link_map = {
#   #     for link_map in local.repository_links :
#   #     "${link_map.repository_name}-${link_map.team_name}" => link_map
#   #   }
# }

# resource "github_team_repository" "this" {
#   # You can use for_each inline to index the list
#   # for_each = {
#   #   for link_map in local.repository_links :
#   #   "${link_map.repository_name}-${link_map.team_name}" => link_map
#   # }
#   for_each   = local.repository_link_map
#   repository = each.value.repository_name
#   team_id    = github_team.this[each.value.team_name].id
#   permission = "push" # pull / push / triage - GitHub Permissions
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
