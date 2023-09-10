variable "github_org" {
  type = string
}

variable "github_token" {
  type = string
}

variable "parent_teams" {
  type = list(object({
    name        = string
    description = string
    privacy     = string
  }))
}

variable "teams" {
  type = list(object({
    name        = string
    description = string
    privacy     = string
    parent_team = string
  }))
}

variable "members" {
  type = list(object({
    username  = string
    team_role = map(string)
  }))
}

variable "repositories" {
  type = list(object({
    name        = string
    description = string
  }))
}
