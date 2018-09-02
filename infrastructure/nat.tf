# nat gw
resource "aws_eip" "nat" {
  vpc      = true
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.mongodb-public-1.id}"
  depends_on = ["aws_internet_gateway.mongodb-gw"]
}

# VPC setup for NAT
resource "aws_route_table" "mongodb-private" {
    vpc_id = "${aws_vpc.mongodb.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
    }

    tags {
        Name = "mongodb-private-1"
    }
}
# route associations private
resource "aws_route_table_association" "mongodb-private-1-a" {
    subnet_id = "${aws_subnet.mongodb-private-1.id}"
    route_table_id = "${aws_route_table.mongodb-private.id}"
}
resource "aws_route_table_association" "mongodb-private-2-a" {
    subnet_id = "${aws_subnet.mongodb-private-2.id}"
    route_table_id = "${aws_route_table.mongodb-private.id}"
}
resource "aws_route_table_association" "mongodb-private-3-a" {
    subnet_id = "${aws_subnet.mongodb-private-3.id}"
    route_table_id = "${aws_route_table.mongodb-private.id}"
}
