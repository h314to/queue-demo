terraform {
  required_version = "~> 0.13"
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "h314to"

    workspaces {
      prefix = "pulse-queue-"
    }
  }
}

provider "aws" {
  version = "~> 3.11.0"
  region  = "eu-west-1"
}