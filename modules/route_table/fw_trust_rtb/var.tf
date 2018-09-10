variable "fw_trust_rtb_name" {
  description = "Enter the Tag name for the fw_trust Route Table "
  default     = "DC-rtb-fw_trust"
}

variable "vpc_id" {} //Needs to be send on when Module called

variable "fw1_trust_intf_id" {}

