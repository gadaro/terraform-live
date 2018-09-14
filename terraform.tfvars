terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket         = "terraform-state-neogabe"
      key            = "${path_relative_to_include()}/terraform.tfstate"
      region         = "eu-west-3"
      encrypt        = true
      dynamodb_table = "lock-table-neogabe"

      s3_bucket_tags {
        owner = "Terragrunt"
        name  = "terraform-state-storage"
      }

      dynamodb_table_tags {
        owner = "Terragrunt"
        name  = "terraform-lock-table"
      }
    }
  }
}
