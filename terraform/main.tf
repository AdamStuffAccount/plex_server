provider "vsphere" {
        user = "administrator@vsphere.local"
        password = "Hulkub1543Dadgog!"
        vsphere_server = "192.168.1.253"
        allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
    name = "Datacenter01"
}

data "vsphere_datastore" "datastore" {
    name = "vm-data01"
    datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
    name = "Cluster01"
    datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
    name = "VM Network"
    datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
    name = "ltemplate01"
    datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "lkubes01" {
    name = "lkubes01"
    resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
    datastore_id = data.vsphere_datastore.datastore.id

    num_cpus = 1
    memory = 1024
    guest_id = data.vsphere_virtual_machine.template.guest_id

    scsi_type = data.vsphere_virtual_machine.template.scsi_type

    network_interface {
        network_id = data.vsphere_network.network.id
    }

    disk {
        label = "disk0"
        size = data.vsphere_virtual_machine.template.disks.0.size
        eagerly_scrub = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
        thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    }

    clone {
        template_uuid = data.vsphere_virtual_machine.template.id

            customize {

                linux_options {
                    host_name = "lkubes01"
                    domain = "test.local"
                }

                network_interface {
                    ipv4_address = "192.168.1.151"
                    ipv4_netmask = "24"
                }

                ipv4_gateway = "192.168.1.254"
            }


    }
}

resource "vsphere_virtual_machine" "lkubes02" {
    name = "lkubes02"
    resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
    datastore_id = data.vsphere_datastore.datastore.id

    num_cpus = 1
    memory = 1024
    guest_id = data.vsphere_virtual_machine.template.guest_id

    scsi_type = data.vsphere_virtual_machine.template.scsi_type

    network_interface {
        network_id = data.vsphere_network.network.id
    }

    disk {
        label = "disk0"
        size = data.vsphere_virtual_machine.template.disks.0.size
        eagerly_scrub = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
        thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    }

    clone {
        template_uuid = data.vsphere_virtual_machine.template.id

            customize {

                linux_options {
                    host_name = "lkubes02"
                    domain = "test.local"
                }

                network_interface {
                    ipv4_address = "192.168.1.152"
                    ipv4_netmask = "24"
                }

                ipv4_gateway = "192.168.1.254"
            }


    }
}

resource "vsphere_virtual_machine" "lkubes03" {
    name = "lkubes03"
    resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
    datastore_id = data.vsphere_datastore.datastore.id

    num_cpus = 1
    memory = 1024
    guest_id = data.vsphere_virtual_machine.template.guest_id

    scsi_type = data.vsphere_virtual_machine.template.scsi_type

    network_interface {
        network_id = data.vsphere_network.network.id
    }

    disk {
        label = "disk0"
        size = data.vsphere_virtual_machine.template.disks.0.size
        eagerly_scrub = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
        thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    }

    clone {
        template_uuid = data.vsphere_virtual_machine.template.id

            customize {

                linux_options {
                    host_name = "lkubes03"
                    domain = "test.local"
                }

                network_interface {
                    ipv4_address = "192.168.1.153"
                    ipv4_netmask = "24"
                }

                ipv4_gateway = "192.168.1.254"
            }


    }
}
