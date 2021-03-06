/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
resource "aws_nat_gateway" "natgw" {
  allocation_id = "${var.natgw_eip}"
  subnet_id     = "${var.natgw_subnet_id}"

  tags {
    Name = "${var.natgw_name}"
  }
}
