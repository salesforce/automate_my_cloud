resource "aws_subnet" "fw_mgmt_subnet" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.fw_mgmt_cidr_block}"
  availability_zone ="${var.az}"
  tags {
    Name = "${var.fw_mgmt_subnet_name}"
  }
}
