variable "virtual_machines" {
    default = {
        "www" = {
            vmid = "171"
            hostname = "www"
            memory = "1024",
            hdd_size = "5G",
            ip_address = "192.168.82.51/24"
        },
        "wiki1" = {
            vmid = "172"
            hostname = "wiki1"
            memory = "2048",
            hdd_size = "10G",
            ip_address = "192.168.82.52/24"
        },
        "wiki2" = {
            vmid = "173"
            hostname = "wiki2"
            memory = "2048",
            hdd_size = "10G",
            ip_address = "192.168.82.53/24"
        },
        "mysqlmaster" = {
            vmid = "174"
            hostname = "mysqlmaster"
            memory = "2048",
            hdd_size = "10G",
            ip_address = "192.168.82.54/24"               
        },  
        "mysqlslave" = {
            vmid = "175"
            hostname = "mysqlslave"
            memory = "2048",
            hdd_size = "10G",
            ip_address = "192.168.82.55/24"          
        },          
        "observer" = {
            vmid = "176"
            hostname = "observer"
            memory = "4096",
            hdd_size = "15G",
            ip_address = "192.168.82.56/24"   
        },
        "passbolt" = {
            vmid = "141"
            hostname = "passbolt"
            memory = "4096",
            hdd_size = "15G",
            ip_address = "192.168.82.57/24"   
        }
    }
}
variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+BK8ZYvPaZ0VighkzODkJWpFaGGlcInIiX19xrFU/fH85LZ0B3z79z1lSRdu+cVtV98TakYpMD6rm01N8f0FpKVMOJLTqyx/VaSC2Dse1fo3qISAB5b6jpkKc9GjHBtfHGsG4i/qinakrmKgpt1AhVhX+nYhvNWLMZxVLs9UHnoN2vXtFo9wCGMh7AxMu2oTqi8zk5Fip/DrRvXBN3zBBhVfWMXUta1mTbsquirVZUdTV70vlhg7aabV7aFyN3YASrHJutIl/BC3BaPwoJAAba5YS2WIrMbp3MYcwVHsSBB0EEj39xEgZj2Se3d9Hb9t+zOShdQGVmThsdnnTSkDefmiMIFugYJDX742+Uy7m80CyJ6gm4TlYV0CKl3qqPlvwuRRwUYM8O7BFFuGKVu+sQsRdcrF0kCi+cspQUAzIWcxTfgmDkxqMjRa8GkV95hLJaTuJWBYsr1NEaPCcc2NbhThxfVd9hYIXTw+fLQlP4hJK8hFtp+OSU3WWMP05Y9E= andrey_abramenko@DESKTOP-CQLGVSH"
}
variable "proxmox_host" {
    default = "vmpool01"
}
variable "template_name" {
    default = "ubuntu-2004-cloud-templ"
}
