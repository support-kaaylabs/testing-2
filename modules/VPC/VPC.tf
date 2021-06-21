#Create VPC

resource "aws_vpc" "zupain" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc_tagname}"
  }
}

#Create Subnet

resource "aws_subnet" "zupain_public" {
  count      = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${element(var.subnet_cidr_pub,count.index)}"

  tags = {
    Name = "${var.pub_subname}-${count.index+1}"
  }
}

resource "aws_subnet" "zupain_private" {
  count      = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${element(var.subnet_cidr_pri,count.index)}"

  tags = {
    Name = "${var.pri_subname}-${count.index+1}"
  }
}

#Creating RDS DB aws_db_subnet_group

resource "aws_db_subnet_group" "zupain" {
  name       = "${var.db_subnet_name}"
  subnet_ids = "${aws_subnet.zupain_private.*.id}"
}

#Create aws_internet_gateway
resource "aws_internet_gateway" "zupain" {
    
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "${var.igt_name}"
  }
}

#Create elastic IP

resource "aws_eip" "zupain" {
  vpc      = true
}

#Create NAT Gateway

resource "aws_nat_gateway" "zupain" {
  allocation_id = aws_eip.zupain.id
  subnet_id     = "${aws_subnet.zupain_public[0].id}"

  tags = {
    Name = "${var.natname}"
  }
}

#Create public Route Table

resource "aws_route_table" "zupain_public" {
    
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.zupain.id
  }
  tags = {
    Name = "${var.pubroutetable_name}"
  }
}

#Create private Route Table

resource "aws_route_table" "zupain_private" {
    
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id= aws_nat_gateway.zupain.id
  }
  tags = {
    Name = "${var.priroutetable_name}"
  }
}

#subet assoiciation with public route Table

resource "aws_route_table_association" "zupain_public" {

  count          = "${length(aws_subnet.zupain_public.*.id)}"
  subnet_id      = "${element(aws_subnet.zupain_public.*.id, count.index)}"
  route_table_id =  aws_route_table.zupain_public.id
}

#subet assoiciation with private route Table

resource "aws_route_table_association" "zupain_private" {

  count          = "${length(aws_subnet.zupain_private.*.id)}"
  subnet_id      = "${element(aws_subnet.zupain_private.*.id, count.index)}"
  route_table_id =  aws_route_table.zupain_private.id
}

output "vpc_id" {
  value = "${aws_vpc.zupain.id}"
}

output "subnet_id" {
  value = "${aws_subnet.zupain_public.*.id}"
}

output "subnet_id2" {
  value = "${aws_subnet.zupain_public[0].id}"
}  

output "subnet_id3" {
  value = "${aws_subnet.zupain_public[1].id}"
}

output "subnet_id_pri" {
  value = "${aws_subnet.zupain_private.*.id}"
}

output "db_subnet_group" {
  value = "${aws_db_subnet_group.zupain.id}"
}