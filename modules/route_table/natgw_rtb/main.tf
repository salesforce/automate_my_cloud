/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
resource "aws_route_table" "natgw_rtb" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"

    nat_gateway_id = "${var.natgw_id}"
  }

  tags {
    Name = "${var.natgw_rtb_name}"
  }
}
