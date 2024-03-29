# Add the provider

provider "aws" {
  region = "us-east-1"
  access_key = "test"
  secret_key = "test"
}

resource "aws_instance" "myapp" {
  ami = "ami-bf5540df"
  instance_type = "t2.micro"
  security_group = ["${aws_security_group.myAppsg.name}"]

  tags {
      name = "app-server"
  }
}







