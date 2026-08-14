resource "oci_core_virtual_network" "this" {
    compartment_id = var.compartment_id
    display_name = "${var.display_name}-VCN"
    cidr_block = var.vcn_cidr
}

resource "oci_core_internet_gateway" "this" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.this.id
    display_name = "${var.display_name}-IGW"
}

resource "oci_core_route_table" "this" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.this.id
    display_name = "${var.display_name}-RT"

    route_rules {
        destination = "0.0.0.0/0"
        network_entity_id = oci_core_internet_gateway.this.id
    }
}

resource "oci_core_security_list" "this" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.this.id
    display_name = "${var.display_name}-SL"

    egress_security_rules {
        protocol = "all"
        destination = "0.0.0.0/0"
    }

    ingress_security_rules {
        protocol = "6"
        tcp_options {
            min = 22
            max = 22
        }
        source = var.allow_ssh_ip
    }

    ingress_security_rules {
        protocol = "6"
        tcp_options {
            min = 80
            max = 80
        }
        source = "0.0.0.0/0"
    }

    ingress_security_rules {
        protocol = "6"
        tcp_options {
            min = 443
            max = 443
        }
        source = "0.0.0.0/0"
    }
}

resource "oci_core_subnet" "public" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.this.id
    display_name = "${var.display_name}-PUBLIC-SUBNET"
    cidr_block = var.public_subnet_cidr
    route_table_id = oci_core_route_table.this.id
    security_list_ids = [oci_core_security_list.this.id]
}