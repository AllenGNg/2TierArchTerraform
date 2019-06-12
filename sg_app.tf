resource "aws_security_group" "myAppsg" {
  name = "app-server-sg"
  
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]
  }

  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.office_ip}"]
  }

  ingress {
      from_port = 21
      to_port = 21
      protocol = "tcp"
      cidr_blocks = ["${var.office_ip}"]
  }

  ingress {
      from_port = 25
      to_port = 25
      protocol = "tcp"
      cidr_blocks = ["${var.office_ip}"]
  }

  ingress {
      from_port = 25
      to_port = 25
      protocol = "tcp"
      cidr_blocks = ["${var.home_ip}"]
  }
}