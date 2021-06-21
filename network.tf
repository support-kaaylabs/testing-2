
module "vpc" {
        source             = "./modules/VPC"
        vpc_tagname        = "zupain"
        pub_subname        = "zupain-public"
        pri_subname        = "zupain-private"
        igt_name           = "zupain"
        eip_name           = "nat-eip"
        natname            = "zupain"
        pubroutetable_name = "zupain-public"
        priroutetable_name = "zupain-private"
        db_subnet_name     = "zupain"
        vpc_cidr           = "172.16.0.0/16"
        vpc_id             = "${module.vpc.vpc_id}"
        subnet_cidr_pub    = ["172.16.0.0/20","172.16.16.0/20","172.16.32.0/20"]
        subnet_cidr_pri    = ["172.16.64.0/20","172.16.128.0/20","172.16.240.0/20"]
}