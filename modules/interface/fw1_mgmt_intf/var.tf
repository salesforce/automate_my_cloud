variable "fw1_mgmt_intf_name" {
  description = "Name to be given to fw1_mgmt interface"
  default     = "DC_fw1_mgmt"
}

variable "fw_mgmt_subnet_id" {
  description = "Enter subnet id of fw_mgmt Subnet"
}

variable "fw_mgmt_sg_id" {
  description = "Enter SG id of fw_mgmt Security Group"
}
