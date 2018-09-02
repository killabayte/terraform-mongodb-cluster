resource "aws_instance" "bastion" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.mongodb-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.bastion-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.bastionkeypair.key_name}"

  tags {
    Name = "bastion"
  }
}

resource "aws_instance" "mongodbone" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.mongodb-private-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-mongodb.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.bastionkeypair.key_name}"

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-mongodb.rendered}"

  tags {
    Name = "mongodbone"
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "us-west-2a"
    size = 1000
    type = "gp2"
    tags {
        Name = "extra volume data one"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.mongodbone.id}"
}

resource "aws_instance" "mongodbtwo" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.mongodb-private-2.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-mongodb.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.bastionkeypair.key_name}"

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-mongodb.rendered}"

  tags {
    Name = "mongodbtwo"
  }
}

resource "aws_ebs_volume" "ebs-volume-2" {
    availability_zone = "us-west-2b"
    size = 1000
    type = "gp2"
    tags {
        Name = "extra volume data two"
    }
}

resource "aws_volume_attachment" "ebs-volume-2-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id = "${aws_ebs_volume.ebs-volume-2.id}"
  instance_id = "${aws_instance.mongodbtwo.id}"
}

resource "aws_instance" "mongodbthree" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.mongodb-private-3.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-mongodb.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.bastionkeypair.key_name}"

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-mongodb.rendered}"

  tags {
    Name = "mongodbthree"
  }
}

resource "aws_ebs_volume" "ebs-volume-3" {
    availability_zone = "us-west-2c"
    size = 1000
    type = "gp2"
    tags {
        Name = "extra volume data three"
    }
}

resource "aws_volume_attachment" "ebs-volume-3-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id = "${aws_ebs_volume.ebs-volume-3.id}"
  instance_id = "${aws_instance.mongodbthree.id}"
}
