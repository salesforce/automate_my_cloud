/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "fw_untrust_rtb_name" {
  description = "Enter the Tag name for the fw_untrust Route Table "
  default     = "DC-rtb-fw_untrust"
}

variable "vpc_id" {} //Needs to be send on when Module called
variable "igw_id" {}
variable "fw_untrust_subnet_id" {}
