resource "oci_identity_compartment" "cloudops-lab" {
    name = "CLOUDOPS-LAB"
    description = "Compartment for CloudOps Lab"
}

module "vcn" {
    source = "../../modules/vcn"
    compartment_id = oci_identity_compartment.cloudops-lab.id
    vcn_cidr = var.vcn_cidr
    display_name = var.display_name
    public_subnet_cidr = var.public_subnet_cidr
    allow_ssh_ip = var.allow_ssh_ip
}

module "instance" {
    source = "../../modules/compute"
    tenancy_ocid = var.tenancy_ocid
    compartment_id = oci_identity_compartment.cloudops-lab.id
    display_name = var.display_name
    shape = var.shape
    ssh_public_key_path = var.ssh_public_key_path
    subnet_id = module.vcn.public_subnet_id
}