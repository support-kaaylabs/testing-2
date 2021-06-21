module "df_targetgrp_grp" {
        source               = "./modules/TAR_GRP"   
        targetgrp_name       = "terraform"
        trg_vpc_id           = "${module.vpc.vpc_id}"
        deregistration_delay = 30
        healthcheck          = "/"
}