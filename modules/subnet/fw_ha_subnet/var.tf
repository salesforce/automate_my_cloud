/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "fw_ha_subnet_name" {
  description = "Enter the Tag name for the fw_ha Subnet"
  default     = "DC_fw_ha"
}

variable "fw_ha_cidr_block" {
  description = "Enter the CIDR block for fw_ha subnet"
  default     = "172.16.11.0/24"
}

variable "az" {}
variable "vpc_id" {} //Needs to be send on when Module called
