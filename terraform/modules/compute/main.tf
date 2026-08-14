resource "oci_core_instance" "this" {
    compartment_id = var.compartment_id
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    shape = var.shape

    create_vnic_details {
        subnet_id = var.subnet_id
        assign_public_ip = true
    }

    source_details {
        source_type = "image"
        source_id = data.oci_core_images.ubuntu.images[0].id
    }

    metadata = {
        ssh_authorized_keys = file(var.ssh_public_key_path)
    }

    display_name = "${var.display_name}-instance"
}