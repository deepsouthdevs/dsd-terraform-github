# -- Using count

# count
# resource "github_repository" "repo" {
#   count       = 4 # Add one
#   name        = "MyRepository${count.index}"
#   description = "Repo number ${count.index}"
# }

# # -- Using for_each

# # for_each
# resource "github_repository" "this" {
#   for_each = {
#     CosmicCanvas = {
#       description = "Your cosmic hub for seamless team collaboration and project management"
#     }
#     NebulaFusion = {
#       description = "Your cosmic hub for seamless team collaboration and project management"
#     }
#   }

#   name        = each.key
#   description = each.value.description
# }

# # # -- Using for_each with locals

# locals {
#   repositories = {
#     NebulaFusion = {
#       description = "Your cosmic hub for seamless team collaboration and project management"
#     }
#     CosmicCanvas = {
#       description = "Hi"
#     }
#   }
# }

# resource "github_repository" "this" {
#   for_each    = local.repositories
#   name        = each.key
#   description = each.value.description
# }

# # -- Using count with locals
# # locals {
# #   # Add a new repo somewhere in the list, TEST
# #   repositories = ["MyRepository1", "TEST", "MyRepository2", "MyRepository3"]
# # }

# # resource "github_repository" "this" {
# #   count       = length(local.repositories)
# #   name        = local.repositories[count.index]
# #   description = "Repo number ${count.index}"
# # }
