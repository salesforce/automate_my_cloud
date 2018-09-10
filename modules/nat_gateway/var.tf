variable "natgw_name" {
  description = "Enter the Tag name for the Nat Gateway"
  default     = "DC_natgw"
}

variable "natgw_eip" {}

variable "natgw_subnet_id" {}

//Needs to be send on when Module called

