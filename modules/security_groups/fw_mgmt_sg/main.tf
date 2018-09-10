resource "aws_security_group" "fw_mgmt_security_group" {
  description = "Security group for Firewall MGMT"
  vpc_id      = "${var.vpc_id}"
  name = "${var.fw_mgmt_security_group_name}"

  ## Incoming Traffic
  ingress {
    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

    description = "ALL"
  } #Rule 1

  ## Outgoing Traffic
  egress {
    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

    description = "ALL"
  } #Rule 1

  tags {
    Name = "${var.fw_mgmt_security_group_name}"
  }
}
