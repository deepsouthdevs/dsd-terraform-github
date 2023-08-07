parent_teams = [
  {
    name        = "engineering"
    description = "Software Engineering - Managed by Terraform"
    privacy     = "closed"
  }
]

teams = [
  {
    name        = "engineering-admins"
    description = "Admins in Engineering - Managed by Terraform"
    privacy     = "closed"
    parent_team = "engineering"
  },
  {
    name        = "engineering-users"
    description = "Software Engineers - Managed by Terraform"
    privacy     = "closed"
    parent_team = "engineering"
  },
]
