provider "aws" {
  region  = "eu-west-3"
  version = "~> 1.36"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webserver-prod"
  db_remote_state_bucket = "terraform-state-neogabe"
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"
  instance_type          = "t2.medium"
  min_size               = 2
  max_size               = 4
}
