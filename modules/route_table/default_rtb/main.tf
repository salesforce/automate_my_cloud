resource "aws_default_route_table" "default_rtb" {
  default_route_table_id = "${var.default_rtb_id}"

  route {cidr_block = "0.0.0.0/0", network_interface_id = "${var.fw1_trust_intf_id}" }
  tags {
    Name = "${var.default_rtb_name}"
  }
}
