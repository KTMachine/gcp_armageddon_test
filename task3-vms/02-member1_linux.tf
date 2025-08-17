# Member 1's Linux VM
resource "google_compute_instance" "member1_linux" {
  provider = google.member1
  name = "member1-linux-vm"
  machine_type = var.linux_vm_configs["member1"].machine_type
  zone = var.linux_vm_configs["member1"].zone
  tags = ["member1-fw"]

  boot_disk {
    initialize_params {
      image = var.linux_vm_configs["member1"].disk_image
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

# Firewall: Allow Windows VM to SSH
resource "google_compute_firewall" "member1_allow_ssh" {
  provider = google.member1
  name = "allow-windows-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    port = "22"
  }

  source_tags = ["windows-vm"]
  target_tags = ["member1-fw"]
}