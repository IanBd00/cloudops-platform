variable "user_ocid" {
    description = "The OCID of the user."
    type        = string
}

variable "fingerprint" {
    description = "The fingerprint of the API key."
    type        = string
}

variable "tenancy_ocid" {
    description = "The OCID of the tenancy."
    type        = string
}

variable "region" {
    description = "The region to use for the provider."
    type        = string
}

variable "private_key_path" {
    description = "The path to the private key file."
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

variable "shape" {
    description = "The shape of the compute instance."
    type        = string
}

variable "ssh_public_key_path" {
    description = "The path to the SSH public key file."
    type        = string
}