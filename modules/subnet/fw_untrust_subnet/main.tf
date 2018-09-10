resource "aws_subnet" "fw_untrust_subnet" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.fw_untrust_cidr_block}"
  availability_zone ="${var.az}"
  tags {
    Name = "${var.fw_untrust_subnet_name}"
  }
}
