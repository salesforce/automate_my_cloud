output "elastic_ip" {
  value = "${aws_eip.elastic_ip.id}"
}
