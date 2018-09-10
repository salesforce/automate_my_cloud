resource "aws_network_interface" "fw1_ha_intf" {
  subnet_id = "${var.fw_ha_subnet_id}"

  security_groups = ["${var.fw_ha_sg_id}"]
  tags {
       Name = "${var.fw1_ha_intf_name}"
   }
}
