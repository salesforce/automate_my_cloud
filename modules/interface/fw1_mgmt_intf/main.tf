/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
resource "aws_network_interface" "fw1_mgmt_intf" {
  subnet_id = "${var.fw_mgmt_subnet_id}"

  security_groups = ["${var.fw_mgmt_sg_id}"]

  tags {
    Name = "${var.fw1_mgmt_intf_name}"
  }
}
