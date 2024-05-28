terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}
provider "aws" {
  region = var.region
}
module "vpc" {
  source                       = "../Modules/VPC"
  region                       = var.region
  vpc_cidr                     = var.vpc_cidr
  project_name                 = var.project_name
  prashansa_public_subnet_cidr1       = var.prashansa_public_subnet_cidr1
  prashansa_public_subnet_cidr2       = var.prashansa_public_subnet_cidr2
  prashansa_private_subnet_cidr1  = var.prashansa_private_subnet_cidr1
  prashansa_private_subnet_cidr2  = var.prashansa_private_subnet_cidr2
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2

}
module "NAT" {
  source                     = "../Modules/NAT"
  project_name               = var.project_name
  vpc_id                     = module.vpc.vpc_id
  internet_gateway           = module.vpc.internet_gateway
  public_subnet_az1_id       = module.vpc.public_subnet_az1_id
  public_subnet_az2_id       = module.vpc.public_subnet_az2_id
  app_private_subnet_az1_id  = module.vpc.app_private_subnet_az1_id
  app_private_subnet_az2_id  = module.vpc.app_private_subnet_az2_id
  data_private_subnet_az1_id = module.vpc.data_private_subnet_az1_id
  data_private_subnet_az2_id = module.vpc.data_private_subnet_az2_id
}
module "security_group" {
  source       = "../Modules/Security_Group"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}
module "Instance" {
  source = "../Modules/Instance"
  project_name         = var.project_name
  security_group_id    = module.security_group.security_group_id
  public_subnet_az1_id = module.vpc.public_subnet_az1_id
  public_subnet_az2_id = module.vpc.public_subnet_az2_id
}
module "load_balancer" {
  source               = "../Modules/Load_Balancer"
  project_name         = var.project_name
  vpc_id               = module.vpc.vpc_id
  security_group_id    = module.security_group.security_group_id
  public_subnet_az1_id = module.vpc.public_subnet_az1_id
  public_subnet_az2_id = module.vpc.public_subnet_az2_id
  instance_az_i_id     = module.Instance.instance_az_i_id
  instance_az_ii_id    = module.Instance.instance_az_ii_id
}