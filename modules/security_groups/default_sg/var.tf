/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "dns_ext_security_group_name" {
  description = "Enter the Tag name for the Default"
  default     = "DC_default"
}

variable "vpc_id" {} //Needs to be send on when Module called
