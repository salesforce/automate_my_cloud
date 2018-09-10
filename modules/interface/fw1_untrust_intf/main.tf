resource "aws_network_interface" "fw1_untrust_intf" {
  subnet_id = "${var.fw_untrust_subnet_id}"

  security_groups = ["${var.fw_untrust_sg_id}"]
  tags {
      Name = "${var.fw1_untrust_intf_name}"
  }
}
