/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
resource "aws_subnet" "fw_ha_subnet" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.fw_ha_cidr_block}"
  availability_zone = "${var.az}"

  tags {
    Name = "${var.fw_ha_subnet_name}"
  }
}
