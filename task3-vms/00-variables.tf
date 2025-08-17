# Variables for Terraform configuration
variable "windows_vm_config" {
  description = "Configuration for the central Windows VM"
  type = object ({
    machine_type = string
    disk_image = string
    zone = string
  })
  default = {
    machine_type = "n1-standard-2"
    disk_image = "windows-server-2019-dc-v20220315"
    zone = "us-central1-a"
  }
}

variable "linux_vm_configs" {
  description = "Configuration for Linux VMs per member"
  type = map(object({
    machine_type = string
    disk_image = string
    zone = string
  }))
  default = {
    member1 = {
      machine_type = "e2-micro"
      disk_image = "ubuntu-2204-jammy-v20230919"
      zone = "europe-west1-b"
      region = "europe-west1"
    },
    member2 = {
      machine_type = "e2-micro"
      disk_image = "debian-11-bullseye-v20230912"
      zone = "asia-southeast1-a"
      region = "asia-southeast1"
    }
  }
}