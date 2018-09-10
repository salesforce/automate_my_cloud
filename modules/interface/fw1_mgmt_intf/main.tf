resource "aws_network_interface" "fw1_mgmt_intf" {
  subnet_id = "${var.fw_mgmt_subnet_id}"

  security_groups = ["${var.fw_mgmt_sg_id}"]
  tags {
      Name = "${var.fw1_mgmt_intf_name}"
  }
}