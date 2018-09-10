/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
variable "vpc_cidr" {
  description = "Enter the CIDR Block for the VPC "
  default     = "172.16.0.0/16"
}

variable "vpc_name" {
  description = "Enter the Tag name for the VPC "
  default     = "MY_DC_VPC"
}
