variable "vpc_cidr" {
    description =  "CIDR VPC"
    type = string
}

variable "public_subnet_cidr" {
    description =  "CIDR Public Subnet"
    type = string
}

variable "availability_zone" {
    description = "Availability Zone"
    type = string
}

variable "project_name" {
    description = "Project Name"
    type = string
}