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
    repository_name        = string
    repository_description = string
    repository_config = object({
      allow_auto_merge                        = optional(bool, false)
      allow_merge_commit                      = optional(bool, true)
      allow_rebase_merge                      = optional(bool, true)
      allow_squash_merge                      = optional(bool, true)
      allow_update_branch                     = optional(bool, false)
      archive_on_destroy                      = optional(bool)
      archived                                = optional(bool, false)
      auto_init                               = optional(bool)
      delete_branch_on_merge                  = optional(bool, false)
      gitignore_template                      = optional(string)
      has_discussions                         = optional(bool, false)
      has_downloads                           = optional(bool, true)
      has_issues                              = optional(bool, false)
      has_projects                            = optional(bool, false)
      has_wiki                                = optional(bool, false)
      homepage_url                            = optional(string, "")
      ignore_vulnerability_alerts_during_read = optional(bool)
      is_template                             = optional(bool, false)
      license_template                        = optional(string)
      merge_commit_message                    = optional(string, "PR_TITLE")
      merge_commit_title                      = optional(string, "MERGE_MESSAGE")
      squash_merge_commit_message             = optional(string, "COMMIT_MESSAGES")
      squash_merge_commit_title               = optional(string, "COMMIT_OR_PR_TITLE")
      topics                                  = optional(list(string))
      visibility                              = optional(string, "private")
      vulnerability_alerts                    = optional(bool, true)
      pages = optional(list(object({
        branch = string
        path   = string
      })))
      security_and_analysis = optional(object({
        advanced_security = object({
          status = string
        })
        secret_scanning = object({
          status = string
        })
        secret_scanning_push_protection = object({
          status = string
        })
      }))
      template = optional(list(object({
        owner                = string
        repository           = string
        include_all_branches = bool
      })))
    })
    repository_role = map(string)
  }))
}
