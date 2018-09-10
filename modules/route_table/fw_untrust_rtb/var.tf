variable "fw_untrust_rtb_name" {
  description = "Enter the Tag name for the fw_untrust Route Table "
  default     = "DC-rtb-fw_untrust"
}

variable "vpc_id" {} //Needs to be send on when Module called
variable "igw_id" {}
variable "fw_untrust_subnet_id" {}
