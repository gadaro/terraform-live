provider "aws" {
  region  = "eu-west-3"
  version = "~> 1.36"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_s3_bucket" "terraform_state" {
    bucket    = "terraform-state-neogabe"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }
}
