/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "default_rtb_name" {
  description = "Enter the Tag name for the Default Route Table "
  default     = "DC-rtb-default"
}

variable "fw1_trust_intf_id" {}

variable "default_rtb_id" {} //Needs to be send on when Module called
