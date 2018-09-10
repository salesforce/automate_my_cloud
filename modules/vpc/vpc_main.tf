//Creating VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "${var.vpc_name}"
  }
}
