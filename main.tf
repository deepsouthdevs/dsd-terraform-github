provider "aws" {
  region = "eu-west-1"
}

terraform {
  required_version = "~> 1.5"
  backend "local" {
    path = "terraform.tfstate"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.24.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_org
}
