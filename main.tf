provider "aws" {
    region = "eu-west-3"
    version = "~> 1.36"
}

resource "aws_instance" "example" {
    ami = "ami-06340c8c12baa6a09"
    instance_type = "t2.micro"
    key_name = "terraform-key"

    tags {
      Name = "terraform-example"
    }
}
