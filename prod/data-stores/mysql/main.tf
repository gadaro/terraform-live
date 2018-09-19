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
  db_storage = 20
  # TODO Already defined in module, but it is needed twice for interactive input
  db_password = "${var.db_password}"
}
