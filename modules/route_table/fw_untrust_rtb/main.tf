/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
resource "aws_route_table" "fw_untrust_rtb" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = "${var.igw_id}"
  }

  tags {
    Name = "${var.fw_untrust_rtb_name}"
  }
}

resource "aws_route_table_association" "fw_untrust_rtb_associated_subnet_1" {
  subnet_id      = "${var.fw_untrust_subnet_id}"
  route_table_id = "${aws_route_table.fw_untrust_rtb.id}"
}
