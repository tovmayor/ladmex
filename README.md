Repository for linux administrator study

Creating VM infrastructure on Proxmox host with:
- nginx balanced reverse-proxy
- wiki.js CMS - 2 VM
- mysql (mariadb) primary for wiki.js database
- mysql (mariadb) secondary for replicated database
- monitoring VM with ELK-stack, Prometheus, Grafana
- node_exporter data collection for Prometheus on all VM's
- filebeat on nginx for logs collection sending to ELK-stack

Creating VM's with HashiCorp Terraform and configure with ansible.
