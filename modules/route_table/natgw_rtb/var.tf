variable "natgw_rtb_name" {
  description = "Enter the Tag name for the natgw Route Table "
  default     = "DC-rtb-natgw"
}

variable "vpc_id" {} //Needs to be send on when Module called
variable "natgw_id" {}