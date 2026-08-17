module "vpc" {
    source = "../../modules/vpc"
    vpc_cidr = var.vpc_cidr 
    public_subnet_cidr = var.public_subnet_cidr
    availability_zone = var.availability_zone
    project_name = var.project_name
}

module "security" {
    source = "../../modules/security"
    vpc_id = module.vpc.vpc_id
    allowed_ssh_cidr = var.allowed_ssh_cidr
    project_name = var.project_name
}

module "ec2" {
    source = "../../modules/ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = module.vpc.public_subnet_id
    project_name = var.project_name
    sg_id = module.security.sg_id
}# teste ci/cd v2
