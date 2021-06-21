
module "vpc" {
        source             = "./modules/VPC"
        vpc_tagname        = "zupain"
        pub_subname        = "zupain-pub"
        pri_subname        = "zupain-pri"
        igt_name           = "zupain"
        natname            = "zupain"
        pubroutetable_name = "zupain-pub"
        priroutetable_name = "zupain-pri"
        db_subnet_name     = "zupain"
        vpc_cidr           = "172.0.0.0/16"
        vpc_id             = "${module.vpc.vpc_id}"
        subnet_cidr_pub    = ["172.0.8.0/20","172.0.16.0/20","172.0.32.0/20"]
        subnet_cidr_pri    = ["172.0.64.0/20","172.0.128.0/20","172.0.255.0/20"]
}