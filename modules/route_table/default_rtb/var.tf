variable "default_rtb_name" {
  description = "Enter the Tag name for the Default Route Table "
  default     = "DC-rtb-default"
}

variable "fw1_trust_intf_id" {}

variable "default_rtb_id" {} //Needs to be send on when Module called
