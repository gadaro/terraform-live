provider "aws" {
  region  = "eu-west-3"
  version = "~> 1.36"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

module "mysql" {
  source = "../../../modules/data-stores/mysql"

  db_name = "mysql_database_stage"
  db_instance = "db.t2.micro"
  db_storage = 10
  db_password = "$temporal1" # TODO Improve
}
