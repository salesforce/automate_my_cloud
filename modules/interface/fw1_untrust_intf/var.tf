/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "fw1_untrust_intf_name" {
  description = "Name to be given to fw1_untrust interface"
  default     = "DC_fw1_untrust"
}

variable "fw_untrust_subnet_id" {
  description = "Enter subnet id of fw_untrust Subnet"
}

variable "fw_untrust_sg_id" {
  description = "Enter SG id of fw_untrust Security Group"
}
