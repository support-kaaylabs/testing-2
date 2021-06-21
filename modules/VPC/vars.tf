
#Current Region

variable "region" {
  default ="us-east-1"
}

#Variable for VPC and SUBNET

variable "vpc_cidr" {}
variable "vpc_id" {}
variable "subnet_cidr_pub" {
  type = list
}
variable "subnet_cidr_pri" {
  type = list
}

data "aws_availability_zones" "azs" {}

variable "vpc_tagname" {}
variable "pub_subname" {}
variable "pri_subname" {}
variable "igt_name" {}
variable "natname" {}
variable "pubroutetable_name" {}
variable "priroutetable_name" {}
variable "db_subnet_name" {}
