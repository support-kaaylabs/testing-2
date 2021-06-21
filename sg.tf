module "sg" {
        source               = "./modules/SG"
        sg_name              = "kaayoffice-india"
        sg_description       = "Common security group"
        sg_vpc_id            = "${module.vpc.vpc_id}"
}

module "sg_rule1" {
        source               = "./modules/SG_RULE"
        sg_ruletype          = "ingress"
        sg_from_port         = 80
        sg_to_port           = 80
        sg_protocoltype      = "tcp"
        sg_cidr_block        = ["0.0.0.0/0"] 
        sg_ipv6_cidr_block   = ["::/0"]
        sg_group_id          = "${module.sg.security_groups}"
}

module "sg_rule2" {
        source               = "./modules/SG_RULE"
        sg_ruletype          = "ingress"
        sg_from_port         = 443
        sg_to_port           = 443
        sg_protocoltype      = "tcp"
        sg_cidr_block        = ["0.0.0.0/0"] 
        sg_ipv6_cidr_block   = ["::/0"]
        sg_group_id          = "${module.sg.security_groups}"
}

module "sg_rule3" {
        source               = "./modules/SG_RULE"
        sg_ruletype          = "egress"
        sg_from_port         = 0
        sg_to_port           = 0
        sg_protocoltype      = "-1"
        sg_cidr_block        = ["0.0.0.0/0"]
        sg_ipv6_cidr_block   = ["0"]
        sg_group_id          = "${module.sg.security_groups}"
}