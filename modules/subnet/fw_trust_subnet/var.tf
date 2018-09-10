variable "fw_trust_subnet_name" {
  description = "Enter the Tag name for the fw_trust Subnet"
  default     = "DC_fw_trust"
}

variable "fw_trust_cidr_block" {
  description = "Enter the CIDR block for fw_trust subnet"
  default     = "172.16.9.0/24"
}
variable "az" {}
variable "vpc_id" {} //Needs to be send on when Module called
