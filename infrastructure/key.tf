resource "aws_key_pair" "bastionkeypair" {
  key_name = "bastionkeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
