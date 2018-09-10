variable "vpc_cidr" {
  description = "Enter the CIDR Block for the VPC "
  default     = "172.16.0.0/16"
}

variable "vpc_name" {
  description = "Enter the Tag name for the VPC "
  default     = "MY_DC_VPC"
}
