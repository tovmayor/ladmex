variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+BK8ZYvPaZ0VighkzODkJWpFaGGlcInIiX19xrFU/fH85LZ0B3z79z1lSRdu+cVtV98TakYpMD6rm01N8f0FpKVMOJLTqyx/VaSC2Dse1fo3qISAB5b6jpkKc9GjHBtfHGsG4i/qinakrmKgpt1AhVhX+nYhvNWLMZxVLs9UHnoN2vXtFo9wCGMh7AxMu2oTqi8zk5Fip/DrRvXBN3zBBhVfWMXUta1mTbsquirVZUdTV70vlhg7aabV7aFyN3YASrHJutIl/BC3BaPwoJAAba5YS2WIrMbp3MYcwVHsSBB0EEj39xEgZj2Se3d9Hb9t+zOShdQGVmThsdnnTSkDefmiMIFugYJDX742+Uy7m80CyJ6gm4TlYV0CKl3qqPlvwuRRwUYM8O7BFFuGKVu+sQsRdcrF0kCi+cspQUAzIWcxTfgmDkxqMjRa8GkV95hLJaTuJWBYsr1NEaPCcc2NbhThxfVd9hYIXTw+fLQlP4hJK8hFtp+OSU3WWMP05Y9E= i-tango\andrey_abramenko@DESKTOP-CQLGVSH"
}
variable "proxmox_host" {
    default = "192.168.80.10"
}
variable "template_name" {
    default = "Ubuntu20SrvCloud"
}