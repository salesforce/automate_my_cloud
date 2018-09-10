resource "aws_network_interface" "fw1_trust_intf" {
  subnet_id = "${var.fw_trust_subnet_id}"
  security_groups = ["${var.fw_trust_sg_id}"]
  tags {
      Name = "${var.fw1_trust_intf_name}"
  }
}
