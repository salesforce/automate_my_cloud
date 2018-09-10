output "vpc_id" {
  value = "${aws_vpc.my_vpc.id}" //Returning VPC ID
}

output "default_rtb_id" {
  //Returning Default Route Table ID
  value = "${aws_vpc.my_vpc.default_route_table_id}"
}
