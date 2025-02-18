provider "aws" {
  region = var.region
}

# Create the VPC and subnets
module "vpc" {
  source         = "./modules/vpc"
  name           = "myproject"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  azs            = var.azs
}

# Create a Security Group that allows SSH (for EC2) and MySQL (for RDS)
module "security_group" {
  source                     = "./modules/security_group"
  vpc_id                     = module.vpc.vpc_id
  sg_name                    = "ec2-rds-sg"
  ec2_ingress_cidr_blocks    = var.ec2_ingress_cidr_blocks
  rds_ingress_cidr_blocks    = var.rds_ingress_cidr_blocks
}

# Launch an EC2 instance in the public subnet
module "ec2" {
  source           = "./modules/ec2"
  public_subnet_id = element(module.vpc.public_subnets, 0)
  ami              = var.ec2_ami
  instance_type    = var.instance_type
  key_name         = var.key_name
  sg_id            = module.security_group.sg_id
  instance_name    = "ec2-instance"
}

# Provision an RDS MySQL instance in the private subnet
module "rds" {
  source               = "./modules/rds"
  db_identifier        = var.db_identifier
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_instance_class    = var.db_instance_class
  allocated_storage    = var.db_allocated_storage
  private_subnet_ids   = module.vpc.private_subnets
  sg_id                = module.security_group.sg_id
}
