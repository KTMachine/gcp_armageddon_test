# Central Windows VM (Invictus)
resource "google_compute_instance" "windows_vm" {
  name = "monitoring-windows-wm"
  machine_type = var.windows_vm_config.machine_type
  zone = var.windows_vm_config.zone
  tags = ["windows-vm"] # For the firewall rule

  boot_disk {
    initialize_params {
      image = "projects/windows-cloud/global/images/family/windows-2019"
    }
  }

  network_interface {
    network = "default"
    access_config {} # Assign external IP
  }

  metadata = {
    windows-startup-script-ps1 = <<-EOT
      # PowerShell script to test Linux VM connectivity
      Test-NetConnection -ComputerName ${google_compute_instance.member1_linux.network_interface[0].network_ip} -Port 22
      Test-NetConnection -ComputerName ${google_compute_instance.member2_linux.network_interface[0].network_ip} -Port 22
    EOT
  }
}