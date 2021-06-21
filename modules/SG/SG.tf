
#Create Security Group

resource "aws_security_group" "zupain" {
  name        = "${var.sg_name}"
  description = "${var.sg_description}"
  vpc_id      = "${var.sg_vpc_id}"
}

output "security_groups" {
    value = "${aws_security_group.zupain.id}"
}