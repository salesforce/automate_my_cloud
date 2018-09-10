/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
resource "aws_default_security_group" "default_security_group" {
  vpc_id = "${var.vpc_id}"

  ## Incoming Traffic
  ingress {
    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["192.168.0.0/24"]

    description = "Pvt Subnet"
  } #Rule 1

  ## Outgoing Traffic
  egress {
    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["192.168.0.0/24"]

    description = "Pvt Subnet"
  } #Rule 1

  tags {
    Name = "${var.dns_ext_security_group_name}"
  }
}
