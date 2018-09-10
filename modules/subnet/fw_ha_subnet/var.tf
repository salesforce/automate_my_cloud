variable "fw_ha_subnet_name" {
  description = "Enter the Tag name for the fw_ha Subnet"
  default     = "DC_fw_ha"
}

variable "fw_ha_cidr_block" {
  description = "Enter the CIDR block for fw_ha subnet"
  default     = "172.16.11.0/24"
}
variable "az" {}
variable "vpc_id" {} //Needs to be send on when Module called
