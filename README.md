# Automate_My_Cloud

## Table of Contents

1. [Project Automate_My_Cloud](#projectautomate_my_cloud)
2. [Exec Summary](#execsummary)
4. [Project Objectives](#projectobjectives)
5. [Project Requirements](#projectrequirements)
6. [Project Operation](#projectoperation)
7. [Features Deployed](#featuresdeployed)


## Project Automate_My_Cloud

Project Automate_My_Cloud version 2 is Terraform based tool which will help in automating deployment of  Public Cloud Infrastructure from the Network Perspective.

## Exec Summary

This tool currently support AWS and is created in such a manner that it will automatically provision AWS resources which networking team has to create (build) during the development of new Datacenter in AWS Infrastructure. It will help in automatically creating VPC, Route_Table, Subnets, Internet Gateway, Nat Gateway,Security Groups, Interfaces, Elastic IP's, S3 Endpoints, VPC Endpoints, Firewall and Proxy(filter) Instances.

This Tool can be run from anywhere like from  any workstation where it can reach to AWS Infrastructure via API call.

## Project Objectives

This Tool is created so that it can automate deployment of AWS Infrastructure

## Project Requirements

This tool is required you to have AWS CLI credentials setup on the hosts from which it is running. [Click here to See How](https://docs.aws.amazon.com/cli/latest/userguide/clichapgettingstarted.html)

Once you followed the url you might have AWS CLI config and credentail stored under `~/.aws/`

Your `~/.aws/config` file should have something similar <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [profile POC1]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output = json<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; region = apsoutheast1<br />

Your `~/.aws/credentials` file should have something similar <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [POC1]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_key_id = YOUR_ACCESS_KEY<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; secret_access_key = YOUR_SECRECT_KEY<br />

## Tool Architecture

Each directory or modules will have atleast 3 set of files which will end with  `main.tf`, `var.tf` and `out.tf` each file have it's specific roles

	* "main.tf" file will have the actual Terraform code which will be responsible for doing the changes into AWS
	* "var.tf" file will have all the variable that will be used in that directory
	* "out.tf" file will have all the output.

## Installing Terraform on your system

As this tool is based on Terraform we need to install terraform in your system

### For MAC

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	`brew install terraform`


### For Linux

* Find the [appropriate package] (https://www.terraform.io/downloads.html) for your system and download it. Terraform is packaged as a zip archive.After downloading Terraform, unzip the package.

* Terraform runs as a single binary named terraform. Any other files in the package can be safely removed and Terraform will still function. Make sure that the terraform binary is available on the PATH. See [this page](https://stackoverflow.com/questions/14637979/howtopermanentlysetpathonlinuxunix) for instructions on setting the PATH on Linux. [This page](https://stackoverflow.com/questions/1618280/wherecanisetpathtomakeexeonwindows) contains instructions for setting the PATH on Windows.

### Verifiying Terraform
Once installed  you will be able to run `terraform version` command

## Installing the Tool

* Create a new folder in your system  eg `mkdir ~/git`

* Git clone the tool to your system   `cd ~/git` and then run `git clone TOOL_REPO` replace TOOL_REPO with this Directory URL


## Project Operation

Before running this tool we need to provide values to the variables which are located inside all the var.tf file including in the modules. Make sure if all the var.tf file have the variable name and value matching to your need

After changing the variables values as per our need then we are ready to run the tool

Note If you have S3 Bucket to store state file (terraform.tfstate) just rename `backend.tf.bkp` file to `backend.tf` so it will use S3 bucket to create and story the terraform state file.( Ignore this if you don't know or not aware of S3 bucket)

1. Inside `~/git/automate_my_cloud`  run `terraform init` this will initialise your terraform.<br />
2. Run `terraform plan`<br />
3. Run `terraform apply`


### Adding New Route Table
1-  Create new folder under modules/route_table  ex  mkdir "modules/route_table/fw_trust_rtb"

2-  Under the created folder "modules/route_table/fw_trust_rtb"  create 3 new files main.tf, var.tf, out.tf
	ex main.tf, var.tf, out.tf

3-  Edit "modules/route_table/fw_trust_rtb/main.tf" and copy below command

    resource "route_table" "fw_trust_rtb" {
  		vpc_id = "${var.vpc_id}"
  		tags {
    		  Name = "${var.name}"
 		 }
	 }


4-  Edit "modules/route_table/fw_trust_rtb/var.tf"  and copy below command

	variable "name" {
    	description = "Enter the Tag name for the FW Subnet"
    	default = "DCnetsec_fw_trust_rtb" < Replace this with your Tag Name
	}

	variable "vpc_id" {} //Needs to be send on when Module called

5-  Edit "modules/route_table/fw_trust_rtb/out.tf"  and copy below command

	output "id" {
  		value = "${route_table.fw_trust_rtb.id}"
	}
6-  Edit "automate_my_cloud/main.tf" and copy below command

	module "fw_trust_rtb" {
 	source                 = "./modules/route_table/fw_trust_rtb"
  	vpc_id                 = "${module.my_vpc.vpc_id}"
  	fw1_trust_intf_id = "${module.fw1_trust_intf.fw1_trust_intf_id}"
	}

### Adding new subnet
1-  Create new folder under modules/subnet  ex  mkdir "modules/subnet/fw_subnet"

2-  Under the created folder "modules/subnet/fw_subnet"  create 3 new files main.tf, var.tf, out.tf
	ex fw_subnet_main.tf, fw_subnet_var.tf, fw_subnet_out.tf

3-  Edit "modules/subnet/fw_subnet/fw_subnet_main.tf" and copy below command

	resource "subnet" "fw_subnet" {
  		vpc_id = "${var.vpc_id}"
  		cidr_block = "${var.fw_cidr_block}"
  		tags {
    		Name = "${var.fw_subnet_name}"
  		}
	}
4-  Edit "modules/subnet/fw_subnet/fw_subnet_var.tf"  and copy below command

	variable "fw_subnet_name" {
    	description = "Enter the Tag name for the FW Subnet"
    	default = "DCnetsec_fw" < Replace this with your Tag Name
	}
	variable "fw_cidr_block" {
    	description = "Enter the CIDR block for FW subnet"
    	default = "172.16.1.0/24"  < Replace this the cidr block to use
	}

	variable "vpc_id" {} //Needs to be send on when Module called

5-  Edit "modules/subnet/fw_subnet/fw_subnet_out.tf"  and copy below command

	output "fw_subnet_id" {
	  value = "${subnet.fw_subnet.id}"
	}

6-  Edit "automate_my_cloud/main.tf" and copy below command

	module "fw_trust_subnet" {
	  source = "./modules/subnet/fw_trust_subnet"
	  vpc_id = "${module.my_vpc.vpc_id}"
	  az = "${var.az}"
	}

### Adding new Security Groups
1-  Create new folder under modules/security_groups  ex  mkdir "modules/security_groups/fw_trust_sg"

2-  Under the created folder "modules/security_groups/fw_trust_sg""  create 3 new files main.tf, var.tf, out.tf
	ex fw_trust_sg_main.tf, fw_trust_sg_var.tf, fw_trust_sg_out.tf

3- Edit "modules/security_groups/fw_trust_sg/fw_trust_sg_main.tf" and copy below command
	
	resource "aws_security_group" "fw_trust_sg" {
  		description = "Security group for Firewall Trust hosts"
   		vpc_id = "${var.vpc_id}"
  		tags {
    		Name = "${var.fw_trust_sg_name}"
  		}
	}
4-  Edit "modules/sg/fw_trust_sg/fw_trust_sg_var.tf"  and copy below command

	variable "fw_trust_sg_name" {
    	description = "Enter the Tag name for the FW sg"
    	default = "DCnetsec_fw" < Replace this with your Tag Name
	}
	variable "vpc_id" {} //Needs to be send on when Module called

5-  Edit "modules/sg/fw_trust_sg/fw_trust_sg_out.tf"  and copy below command

	output "fw_trust_sg_id" {
	  value = "${security_group.fw_trust_sg.id}"
	}

6-  Edit "automate_my_cloud/main.tf" and copy below command

	module "fw_trust_sg" {
  	source = "./modules/security_groups/fw_trust_sg"
  	vpc_id = "${module.my_vpc.vpc_id}"
	}


## Features Deployed

Feature currently supported and deployed by this Tool

* Creates a VPC
  - Set Name Tag
  - Set CIDR block
  - Set Tenancy as default

* Creates 4 route tables (DC-rtb-default , DC-rtb-fw_trust ,  DC-rtb-fw_untrust,  DC-rtb-natgw )


* In DC-rtb-fw_trust route table
  - create a default gateway towards Fw1 port 1 (Trust Interface)

* In DC-rtb-fw_untrust route table
  - create a default gateway towards Internet Gateway

* In DC-rtb-natgw route table
  - create a default gateway towards NAT Gateway

* Creates below subnet and attached to the respective route table
  - DC-net-fw_untrust
  - DC-net-fw_trust
  - DC-net-fw_mgmt
  - DC-net-fw_ha

* Create an Internet Gateway (DC-igw-gw1) and attach to the vpc

* Create an Nat Gateway

* Create Security Group
    - DC-sg-default
    - DC-sg-fw_ha
    - DC-sg-fw_mgmt
    - DC-sg-fw_trust
    - DC-sg-fw_untrust

* Interface for  Firewall1  Instance
    - fw1-DC_port1 (Trust)
    - fw1-DC_port2 (Untrust)
    - fw1-DC_port3 (HA)
    - fw1-DC_port4 (MGMT)

