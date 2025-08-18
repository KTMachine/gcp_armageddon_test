# Member 2's Linux VM
resource "google_compute_instance" "member2_linux" {
  provider = google.member2
  name = "member2-linux-vm"
  machine_type = var.linux_vm_configs["member2"].machine_type
  zone = var.linux_vm_configs["member2"].zone
  tags = ["member2-fw"]

  boot_disk {
    initialize_params {
      image = var.linux_vm_configs["member2"].disk_image
    }
  }

  network_interface {
    network = "default" 
  }
}

# Firewall: Allow Windows VM to SSH
resource "google_compute_firewall" "member2_allow_ssh" {
  provider = google.member2
  name = "allow-windows-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["windows-vm"]
  target_tags = ["member2-fw"]
}