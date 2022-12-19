terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.84.0"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.80.10:8006/api2/json"
  pm_api_token_id = "root@pam!terraform"  
  pm_api_token_secret = "dfb7917c-3f39-49c5-8428-6cf0d715fb38"
  pm_tls_insecure = true
  pm_debug = true
}

resource "proxmox_vm_qemu" "LinuxAdmin" {

  for_each = var.virtual_machines
  name = each.value.hostname
  target_node = var.proxmox_host

  clone = var.template_name
  os_type = "cloud-init"
  agent = 1

  cores = 2
  sockets = 1
  cpu = "host"
  memory = each.value.memory
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = each.value.hdd_size
    type = "scsi"
    storage = "SSD"
    iothread = 1
  }
  
  network {
    model = "virtio"
    bridge = "vmbr1"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  ipconfig0 = "ip=${each.value.ip_address},gw=192.168.82.1"
  
  ssh_user = "root"
  ssh_private_key = file("~/.ssh/id_rsa")
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF

  connection {
    type        = "ssh"
    host        = self.ssh_host
    user        = self.ssh_user
    private_key = self.ssh_private_key
    port        = self.ssh_port
  }

  provisioner "remote-exec" { #waiting for startup
    inline = [
      "echo 'Ready to connect!'"
    ]
  } 
}
# output "tvm_ip" {
#   value = proxmox_vm_qemu.LinuxAdmin[0].default_ipv4_address
# }
output "tvm_ipa" {
  value = {
    for instance in proxmox_vm_qemu.LinuxAdmin:
    instance.name => instance.default_ipv4_address
  }
}

# output "vm_ipv4_addresses" {
#   value = {
#       for instance in proxmox_vm_qemu.virtual_machines:
#       instance.name => instance.default_ipv4_address
#   }
# }  