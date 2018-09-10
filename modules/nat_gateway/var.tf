/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "natgw_name" {
  description = "Enter the Tag name for the Nat Gateway"
  default     = "DC_natgw"
}

variable "natgw_eip" {}

variable "natgw_subnet_id" {}
