# Windows VM Outputs
output "windows_vm_public_ip" {
  value = google_compute_instance.windows_vm.network_interface[0].access_config[0].nat_ip
  description = "Public IP of the Windows VM"
}

# Member 1 Linux VM Outputs
output "member1_linux_internal_ip" {
  value = google_compute_instance.member1_linux.network_interface[0].network_ip
  description = "Internal IP of Member 1's Linux VM"
}

output "member1_linux_ssh_command" {
  value = "gcloud compute ssh ubuntu@${google_compute_instance.member1_linux.name} --zone ${var.linux_vm_configs["member1"].zone} --project {$var.member1_project_id}"
  description = "SSH command to connect for Member 1's VM"
}

# Member 2 Linux VM Outputs
output "member2_linux_internal_ip" {
  value = google_compute_instance.member2_linux.network_interface[0].network_ip
  description = "Internal IP of Member 2's Linux VM"
}

#Firewall Status
output "firewall_rules_created" {
  value = [
    google_compute_firewall.member1_allow_ssh.name,
    google_compute_firewall.member2_allow_ssh.name
    ]
  description = "List of firewall rules for VM access"
}