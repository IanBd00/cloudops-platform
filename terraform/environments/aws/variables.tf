variable "aws_region" {
    description = "The AWS region to deploy resources in"
    type        = string
    default = "us-east-1"
}

variable "vpc_cidr" {
    description =  "CIDR VPC"
    type = string
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description =  "CIDR Public Subnet"
    type = string
    default = "10.0.1.0/24"
}

variable "availability_zone" {
    description = "Availability Zone"
    type = string
    default = "us-east-1a"
}

variable "project_name" {
    description = "Project Name"
    type = string
    default = "cloudops-platform"
}

variable "allowed_ssh_cidr" {
    description = "CIDR block allowed to access EC2 via SSH"
    type = string
}

variable "ami_id" {
    description = "AMI ID"
    type = string
}

variable "instance_type" {
    description = "Instance type"
    type = string
    default = "t3.micro"
}

variable "key_name" {
    description = "Key pair name"
    type = string
    default = "cloudops-key"
}
