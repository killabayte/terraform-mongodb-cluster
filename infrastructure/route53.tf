resource "aws_route53_zone" "test" {
   name = "test.com"

   tags {
       Environment = "test"
   }
}

resource "aws_route53_record" "bastion-record" {
   zone_id = "${aws_route53_zone.test.zone_id}"
   name = "bastion.test.com"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.bastion.private_ip}"]
}

resource "aws_route53_record" "mongodbone-record" {
   zone_id = "${aws_route53_zone.test.zone_id}"
   name = "mongodbone.test.com"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.mongodbone.private_ip}"]
}

