variable "fw_trust_security_group_name" {
  description = "Enter the Tag name for the fw_trust Subnet"
  default     = "DC_fw_trust"
}

variable "vpc_id" {} //Needs to be send on when Module called
