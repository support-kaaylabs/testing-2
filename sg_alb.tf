module "sg1" {
        source               = "./modules/SG"
        sg_name              = "zupain-loadbalancer"
        sg_description       = "for load balancer"
        sg_vpc_id            = "${module.vpc.vpc_id}"
}

module "sg1_rule1" {
        source               = "./modules/SG_RULE"
        sg_ruletype          = "ingress"
        sg_from_port         = 0
        sg_to_port           = 0
        sg_protocoltype      = "-1"
        sg_cidr_block        = ["0.0.0.0/0"] 
        sg_ipv6_cidr_block   = ["::/0"]
        sg_group_id          = "${module.sg1.security_groups}"
}

module "sg1_rule2" {
        source               = "./modules/SG_RULE"
        sg_ruletype          = "egress"
        sg_from_port         = 0
        sg_to_port           = 0
        sg_protocoltype      = "-1"
        sg_cidr_block        = ["0.0.0.0/0"]
        sg_ipv6_cidr_block   = ["0"]
        sg_group_id          = "${module.sg1.security_groups}"
}