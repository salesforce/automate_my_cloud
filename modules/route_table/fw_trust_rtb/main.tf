resource "aws_route_table" "fw_trust_rtb" {
  vpc_id = "${var.vpc_id}"
  route {cidr_block = "0.0.0.0/0", network_interface_id = "${var.fw1_trust_intf_id}" }
  tags {
    Name = "${var.fw_trust_rtb_name}"
  }
}
