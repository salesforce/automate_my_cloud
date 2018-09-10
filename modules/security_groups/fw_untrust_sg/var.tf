variable "fw_untrust_security_group_name" {
  description = "Enter the Tag name for the fw_untrust Subnet"
  default     = "DC_fw_untrust"
}

variable "vpc_id" {} //Needs to be send on when Module called
