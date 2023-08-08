resource "github_repository" "project1" {
  name        = "Project1"
  description = "Code for our Project1 project"
}

resource "github_team" "pt" {
  name        = "team-project1"
  description = "Project1 team members"
  privacy     = "closed"
}

resource "github_team_repository" "pt-project1" {
  repository = github_repository.project1.name
  team_id    = github_team.pt.id
  permission = "push"
}
