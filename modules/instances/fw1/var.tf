# AMI ID LIST
# N. Virginia	us-east-1 	ami-448d513b
# Ohio	us-east-2 	ami-dbd7e7be
# N. California	us-west-1 	ami-09594a69
# Oregon	us-west-2 	ami-f7abca8f
# GovCloud	us-gov-west-1 	ami-fe0d989f
# Québec	ca-central-1 	ami-fe1c9a9a
# Frankfurt	eu-central-1 	ami-a8bae343
# Ireland	eu-west-1 	ami-21570c58
# London	eu-west-2 	ami-ca8666ad
# Paris	eu-west-3 	ami-c809bfb5
# Singapore	ap-southeast-1 	ami-da0c2ba6
# Sydney	ap-southeast-2 	ami-07dd1465
# Mumbai	ap-south-1 	ami-bb381cd4
# Tokyo 	ap-northeast-1 	ami-d8d2c1a4
# Asia Pacific (Seoul)	ap-northeast-2 	ami-f1ea449f
# São Paulo	sa-east-1 	ami-aa0352c6

variable "ami_id" {
  default = "ami-da0c2ba6"
}

variable "instance_type" {
  description = "Select the size of the instance "
  default     = "c4.4xlarge"
}

variable "fw1" {
  description = "Enter the Tag Name"
  default     = "fw1-DC"
}

variable "fw1_trust_intf_id" {}
variable "fw1_untrust_intf_id" {}
variable "fw1_ha_intf_id" {}
variable "fw1_mgmt_intf_id" {}

