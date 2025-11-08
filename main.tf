module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"
}

module "ec2" {
  source               = "./modules/ec2"
  subnet_id            = module.vpc.subnet_id
  sg_id                = module.security_group.sg_id
  iam_instance_profile = module.iam.instance_profile_name
  instance_type        = var.instance_type
  key_name             = var.key_name
}
