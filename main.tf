// Root main.tf
module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  subnet_id = module.subnet.public_subnet_ids[0]  # Pick one of the two subnets
  security_group_id = module.security_groups.web_sg_id
}

module "rds" {
  source            = "./modules/rds"
  subnet_ids        = module.subnet.public_subnet_ids  # ✅ pass both subnets
  security_group_id = module.security_groups.db_sg_id
}


module "subnet" {
  source  = "./modules/subnet"
  vpc_id  = module.vpc.vpc_id
  igw_id  = module.vpc.igw_id
}
