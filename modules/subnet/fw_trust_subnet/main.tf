resource "aws_subnet" "fw_trust_subnet" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.fw_trust_cidr_block}"
  availability_zone ="${var.az}"
  tags {
    Name = "${var.fw_trust_subnet_name}"
  }
}
