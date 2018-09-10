resource "aws_security_group" "fw_untrust_security_group" {
  description = "Security group for Firewall Untrust hosts"
  vpc_id      = "${var.vpc_id}"
  name = "${var.fw_untrust_security_group_name}"

  ## Incoming Traffic
  ingress {
    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

    description = "ALL"
  }

  ## Outgoing Traffic
  egress {
    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

    description = "ALL"
  }

  tags {
    Name = "${var.fw_untrust_security_group_name}"
  }
}
