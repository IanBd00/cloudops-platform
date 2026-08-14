variable "vpc_id" {
    description = "VPC ID"
    type = string
}

variable "project_name" {
    description = "Project name"
    type = string
}

variable "allowed_ssh_cidr" {
    description = "CIDR block allowed to access EC2 via SSH"
    type = string
}