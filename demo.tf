resource "github_repository" "project1" {
  name        = "Project1"
  description = "Code for our Project1 project"
}

resource "github_team" "pt" {
  name        = "team-pt"
  description = "Here you'll find Project1 members"
  privacy     = "closed"
}


resource "github_team_repository" "pt-project1" {
  repository = "Project1"
  team_id    = github_team.pt.id
  permission = "push"
}
