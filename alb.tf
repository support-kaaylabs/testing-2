module "alb" {
        source              = "./modules/ALB"
        alb_name            = "zupain"
        alb_type            = "application"
        alb_internal        = "true"
        alb_security_groups = ["${module.sg.security_groups}","${module.sg1.security_groups}"]
        alb_subnets         = "${module.vpc.subnet_id_pri}"
}