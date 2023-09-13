variable "github_org" {
  type = string
}

variable "github_token" {
  type = string
}

variable "teams" {
  type = list(object({
    name        = string
    description = string
  }))
}

variable "members" {
  type = list(object({
    username = string
    teams    = list(string)
  }))
}

variable "repositories" {
  type = list(object({
    name        = string
    description = string
    teams       = map(string)
  }))
}
