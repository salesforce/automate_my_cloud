resource "aws_route_table" "natgw_rtb" {
  vpc_id = "${var.vpc_id}"
  route {cidr_block = "0.0.0.0/0", nat_gateway_id = "${var.natgw_id}" }

  tags {
    Name = "${var.natgw_rtb_name}"
  }
}