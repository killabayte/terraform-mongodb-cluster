output "instance" {
  value = "${aws_instance.bastion.public_ip}"
}
