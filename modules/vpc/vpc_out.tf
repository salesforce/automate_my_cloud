/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
output "vpc_id" {
  value = "${aws_vpc.my_vpc.id}" //Returning VPC ID
}

output "default_rtb_id" {
  //Returning Default Route Table ID
  value = "${aws_vpc.my_vpc.default_route_table_id}"
}
