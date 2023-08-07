resource "github_repository" "repo" {
  for_each = {
    for index, repo_map in var.repositories :
    "${repo_map.repository_name}" => repo_map
  }

  name        = each.value.repository_name
  description = each.value.repository_description

  allow_auto_merge                        = each.value.repository_config.allow_auto_merge
  allow_merge_commit                      = each.value.repository_config.allow_merge_commit
  allow_rebase_merge                      = each.value.repository_config.allow_rebase_merge
  allow_squash_merge                      = each.value.repository_config.allow_squash_merge
  allow_update_branch                     = each.value.repository_config.allow_update_branch
  archive_on_destroy                      = each.value.repository_config.archive_on_destroy
  archived                                = each.value.repository_config.archived
  auto_init                               = each.value.repository_config.auto_init
  default_branch                          = each.value.repository_config.default_branch
  delete_branch_on_merge                  = each.value.repository_config.delete_branch_on_merge
  gitignore_template                      = each.value.repository_config.gitignore_template
  has_discussions                         = each.value.repository_config.has_discussions
  has_downloads                           = each.value.repository_config.has_downloads
  has_issues                              = each.value.repository_config.has_issues
  has_projects                            = each.value.repository_config.has_projects
  has_wiki                                = each.value.repository_config.has_wiki
  homepage_url                            = each.value.repository_config.homepage_url
  ignore_vulnerability_alerts_during_read = each.value.repository_config.ignore_vulnerability_alerts_during_read
  is_template                             = each.value.repository_config.is_template
  license_template                        = each.value.repository_config.license_template
  merge_commit_message                    = each.value.repository_config.merge_commit_message
  merge_commit_title                      = each.value.repository_config.merge_commit_title
  squash_merge_commit_message             = each.value.repository_config.squash_merge_commit_message
  squash_merge_commit_title               = each.value.repository_config.squash_merge_commit_title
  topics                                  = each.value.repository_config.topics
  visibility                              = each.value.repository_config.visibility
  vulnerability_alerts                    = each.value.repository_config.vulnerability_alerts
  dynamic "pages" {
    for_each = each.value.repository_config.pages == null ? {} : { for page in each.value.repository_config.pages : "${page.branch}-${page.path}" => page }
    content {
      source {
        branch = pages.value.branch
        path   = pages.value.path
      }
    }
  }
  dynamic "security_and_analysis" {
    for_each = each.value.repository_config.security_and_analysis == null ? [] : [true]
    content {
      advanced_security {
        status = each.value.repository_config.security_and_analysis.advanced_security
      }
      secret_scanning {
        status = each.value.repository_config.security_and_analysis.secret_scanning
      }
      secret_scanning_push_protection {
        status = each.value.repository_config.security_and_analysis.secret_scanning_push_protection
      }
    }
  }
  dynamic "template" {
    for_each = each.value.repository_config.template == null ? {} : { for page in each.value.repository_config.template : "${page.owner}-${page.repository}-${page.include_all_branches}" => page }
    content {
      owner                = template.value.owner
      repository           = template.value.repository
      include_all_branches = template.value.include_all_branches
    }
  }
}
