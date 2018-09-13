provider "aws" {
  region = "eu-west-3"
  version = "~> 1.36"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = "8080"
}

output "public_dns" {
  value = "${aws_instance.example.public_dns}"
}

resource "aws_instance" "example" {
    ami = "ami-06340c8c12baa6a09"
    instance_type = "t2.micro"
    key_name = "terraform-key"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]

    tags {
      Name = "terraform-example"
    }

    user_data = <<-EOF
                #!bin/bash
                yum install -y httpd
                echo "Online server" > /var/www/html/index.html
                sed 's/Listen 80/Listen "${var.server_port}"/' /etc/httpd/conf/httpd.conf -i
                service httpd start
                EOF
}

resource "aws_security_group" "instance" {
    name = "terraform-example-instance-sg"

    ingress {
      from_port = "${var.server_port}"
      to_port = "${var.server_port}"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
