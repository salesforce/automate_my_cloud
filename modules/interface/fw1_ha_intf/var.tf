/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "fw1_ha_intf_name" {
  description = "Name to be given to fw1_ha interface"
  default     = "DC_fw1_ha"
}

variable "fw_ha_subnet_id" {
  description = "Enter subnet id of fw_ha Subnet"
}

variable "fw_ha_sg_id" {
  description = "Enter SG id of fw_ha Security Group"
}
