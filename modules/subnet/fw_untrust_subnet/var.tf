/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "fw_untrust_subnet_name" {
  description = "Enter the Tag name for the fw_untrust Subnet"
  default     = "DC_fw_untrust"
}

variable "fw_untrust_cidr_block" {
  description = "Enter the CIDR block for fw_untrust subnet"
  default     = "172.16.10.0/24"
}

variable "az" {}
variable "vpc_id" {} //Needs to be send on when Module called
