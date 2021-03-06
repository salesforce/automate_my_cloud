/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */

//This is the variable files used by main automate_my_cloud
variable "credentials_file" {
  description = "Enter the location of credential file ex- '~/.aws/credentials' "
  default     = "~/.aws/credentials"
}

variable "profile" {
  description = "CRITICAL-- Please make sure to use right profile-- Enter the profile in the credential file to use ex- 'POC1-TOOL' "
  default     = "POC1"
}

variable "region" {
  description = "Enter the region to be used ex- 'ap-southeast-1'"
  default     = "ap-southeast-1"
}

variable "az" {
  description = "Enter the Availability Zone to be use ex - 'ap-southeast-1a'"
  default     = "ap-southeast-1a"
}
