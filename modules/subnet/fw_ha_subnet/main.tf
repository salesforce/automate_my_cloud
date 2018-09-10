resource "aws_subnet" "fw_ha_subnet" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.fw_ha_cidr_block}"
  availability_zone ="${var.az}"
  tags {
    Name = "${var.fw_ha_subnet_name}"
  }
}
