resource "aws_instance" "myweb" {
  ami = "ami-bf5540df"
  instance_type = "t2.micro"
  security_group = ["${aws_security_group.mysg.name}"]
  key_name = "kplabs-new" # Not a real .pem file.

  tags {
    name = "web-server"
  }

  # Install Nginx on the newly created EC2 Instance when it is created.
  provisioner "remote-exec" {

    # Define the commands to execute.
    inline = [
      "sudo yum -y install epel-release",
      "sudo yum -y install nginx",
      "sudo service nginx start"
    ]
    
    # How we connect to the newly created EC2 Instance to run the above commands.
    connection {
      type = "ssh"
      user = "ecs-user"
      private_key = "${file("./kplabs-new.pem")}" # Load this file to log in. (Not a real .pem file)
    }
  }
}


