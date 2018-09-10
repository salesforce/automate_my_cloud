/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
resource "aws_instance" "fw1" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  network_interface {
    network_interface_id = "${var.fw1_trust_intf_id}"
    device_index         = 0
  }

  network_interface {
    network_interface_id = "${var.fw1_untrust_intf_id}"
    device_index         = 1
  }

  network_interface {
    network_interface_id = "${var.fw1_ha_intf_id}"
    device_index         = 2
  }

  network_interface {
    network_interface_id = "${var.fw1_mgmt_intf_id}"
    device_index         = 3
  }

  tags {
    Name = "${var.fw1}"
  }
}
