provider "aws" {
  region  = "eu-west-3"
  version = "~> 1.36"
}

terraform {
  backend "s3" {
    region = "eu-west-3"
    key = "global/s3/terraform.tfstate"
  }
}

output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-state-neogabe"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }
}
