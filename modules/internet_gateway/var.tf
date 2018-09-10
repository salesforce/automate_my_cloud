/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "igw_name" {
  description = "Enter the Tag name for the Internet Gateway"
  default     = "DC-IGW"
}

variable "vpc_id" {}
