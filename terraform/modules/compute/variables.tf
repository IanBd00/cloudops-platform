variable "compartment_id" {
  description = "The OCID of the compartment where the compute instance will be created."
  type        = string
}

variable "tenancy_ocid" {
  description = "The OCID of the tenancy where the compute instance will be created."
  type        = string
}

variable "shape" {
    description = "The shape of the compute instance."
    type        = string
}

variable "subnet_id" {
    description = "The OCID of the subnet where the compute instance will be created."
    type        = string
}

variable "ssh_public_key_path" {
    description = "The path to the SSH public key file."
    type        = string
}

variable "display_name" {
    description = "The display name of the compute instance."
    type        = string
}