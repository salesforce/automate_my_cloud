variable "fw_mgmt_security_group_name" {
  description = "Enter the Tag name for the fw_mgmt Subnet"
  default     = "DC_fw_mgmt"
}

variable "vpc_id" {} //Needs to be send on when Module called
