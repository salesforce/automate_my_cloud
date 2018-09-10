/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */
provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.credentials_file}"
  profile                 = "${var.profile}"
}

module "my_vpc" {
  source = "./modules/vpc"
}

module "default_rtb" {
  source = "./modules/route_table/default_rtb"

  // Taking value of "default_rtb_id" from "my_vpc" modules out.tf file
  default_rtb_id    = "${module.my_vpc.default_rtb_id}"
  fw1_trust_intf_id = "${module.fw1_trust_intf.fw1_trust_intf_id}"
}

module "fw_trust_rtb" {
  source            = "./modules/route_table/fw_trust_rtb"
  vpc_id            = "${module.my_vpc.vpc_id}"
  fw1_trust_intf_id = "${module.fw1_trust_intf.fw1_trust_intf_id}"
}

module "fw_untrust_rtb" {
  source               = "./modules/route_table/fw_untrust_rtb"
  vpc_id               = "${module.my_vpc.vpc_id}"
  fw_untrust_subnet_id = "${module.fw_untrust_subnet.fw_untrust_subnet_id}"
  igw_id               = "${module.internet_gateway.igw_id}"
}

module "natgw_rtb" {
  source   = "./modules/route_table/natgw_rtb"
  vpc_id   = "${module.my_vpc.vpc_id}"
  natgw_id = "${module.nat_gateway.natgw_id}"
}

module "fw_trust_subnet" {
  source = "./modules/subnet/fw_trust_subnet"
  vpc_id = "${module.my_vpc.vpc_id}"
  az     = "${var.az}"
}

module "fw_untrust_subnet" {
  source = "./modules/subnet/fw_untrust_subnet"
  vpc_id = "${module.my_vpc.vpc_id}"
  az     = "${var.az}"
}

module "fw_ha_subnet" {
  source = "./modules/subnet/fw_ha_subnet"
  vpc_id = "${module.my_vpc.vpc_id}"
  az     = "${var.az}"
}

module "fw_mgmt_subnet" {
  source = "./modules/subnet/fw_mgmt_subnet"
  vpc_id = "${module.my_vpc.vpc_id}"
  az     = "${var.az}"
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = "${module.my_vpc.vpc_id}"
}

module "natgw_eip" {
  source = "./modules/elastic_ip"
}

module "nat_gateway" {
  source          = "./modules/nat_gateway"
  natgw_eip       = "${module.natgw_eip.elastic_ip}"
  natgw_subnet_id = "${module.fw_untrust_subnet.fw_untrust_subnet_id}"
}

module "default_sg" {
  source = "./modules/security_groups/default_sg"
  vpc_id = "${module.my_vpc.vpc_id}"
}

module "fw_untrust_sg" {
  source = "./modules/security_groups/fw_untrust_sg"
  vpc_id = "${module.my_vpc.vpc_id}"
}

module "fw_trust_sg" {
  source = "./modules/security_groups/fw_trust_sg"
  vpc_id = "${module.my_vpc.vpc_id}"
}

module "fw_ha_sg" {
  source = "./modules/security_groups/fw_ha_sg"
  vpc_id = "${module.my_vpc.vpc_id}"
}

module "fw_mgmt_sg" {
  source = "./modules/security_groups/fw_mgmt_sg"
  vpc_id = "${module.my_vpc.vpc_id}"
}

module "fw1_trust_intf" {
  source             = "./modules/interface/fw1_trust_intf"
  fw_trust_subnet_id = "${module.fw_trust_subnet.fw_trust_subnet_id}"
  fw_trust_sg_id     = "${module.fw_trust_sg.fw_trust_security_group_id}"
}

module "fw1_untrust_intf" {
  source               = "./modules/interface/fw1_untrust_intf"
  fw_untrust_subnet_id = "${module.fw_untrust_subnet.fw_untrust_subnet_id}"
  fw_untrust_sg_id     = "${module.fw_untrust_sg.fw_untrust_security_group_id}"
}

module "fw1_ha_intf" {
  source          = "./modules/interface/fw1_ha_intf"
  fw_ha_subnet_id = "${module.fw_ha_subnet.fw_ha_subnet_id}"
  fw_ha_sg_id     = "${module.fw_ha_sg.fw_ha_security_group_id}"
}

module "fw1_mgmt_intf" {
  source            = "./modules/interface/fw1_mgmt_intf"
  fw_mgmt_subnet_id = "${module.fw_mgmt_subnet.fw_mgmt_subnet_id}"
  fw_mgmt_sg_id     = "${module.fw_mgmt_sg.fw_mgmt_security_group_id}"
}

# Creating Instances
module "fw1-instance" {
  source              = "./modules/instances/fw1"
  fw1_trust_intf_id   = "${module.fw1_trust_intf.fw1_trust_intf_id}"
  fw1_untrust_intf_id = "${module.fw1_untrust_intf.fw1_untrust_intf_id}"
  fw1_ha_intf_id      = "${module.fw1_ha_intf.fw1_ha_intf_id}"
  fw1_mgmt_intf_id    = "${module.fw1_mgmt_intf.fw1_mgmt_intf_id}"
}
