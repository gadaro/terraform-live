provider "aws" {
  region  = "eu-west-3"
  version = "~> 1.36"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
}
