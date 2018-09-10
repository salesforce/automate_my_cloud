variable "fw_ha_security_group_name" {
  description = "Enter the Tag name for the fw_ha Subnet"
  default     = "DC_fw_ha"
}

variable "vpc_id" {} //Needs to be send on when Module called
