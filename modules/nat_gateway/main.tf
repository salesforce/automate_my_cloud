resource "aws_nat_gateway" "natgw" {
  allocation_id = "${var.natgw_eip}"
  subnet_id     = "${var.natgw_subnet_id}"

  tags {
    Name = "${var.natgw_name}"
  }
}
