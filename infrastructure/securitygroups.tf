resource "aws_security_group" "bastion-ssh" {
  vpc_id = "${aws_vpc.mongodb.id}"
  name = "bastion-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
tags {
    Name = "bastion-ssh"
  }
}

resource "aws_security_group" "allow-mongodb" {
  vpc_id = "${aws_vpc.mongodb.id}"
  name = "allow-mongodb"
  description = "allow-mongodb"
  ingress {
      from_port = 27017
      to_port = 27017
      protocol = "tcp"
      security_groups = ["${aws_security_group.bastion-ssh.id}"]              # allowing access from our bastion instance
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self = true
  }
  tags {
    Name = "allow-mongodb"
  }
}
