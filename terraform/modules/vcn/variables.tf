variable "compartment_id" {
  description = "The OCID of the compartment where the compute instance will be created."
  type        = string
}

variable "display_name" {
    description = "The display name of the compute instance."
    type        = string
}

variable "vcn_cidr" {
    description = "The CIDR block for the VCN."
    type        = string
}

variable "public_subnet_cidr" {
    description = "The CIDR block for the public subnet."
    type        = string
}

variable "allow_ssh_ip" {
    description = "The CIDR block for allowing SSH access."
    type        = string
}