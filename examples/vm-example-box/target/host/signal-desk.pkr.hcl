packer {
  required_plugins {
    qemu = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

variable "accelerator" {
  type    = string
  # "none" is TCG software emulation: slow, but it builds anywhere, including a
  # laptop with no KVM and an ARM host emulating x86_64. A build machine with
  # /dev/kvm should pass `-var accelerator=kvm` -- same image, minutes not hours.
  default = "none"
}

variable "iso_url" {
  type    = string
  default = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

variable "iso_checksum" {
  type    = string
  default = "file:https://cloud-images.ubuntu.com/noble/current/SHA256SUMS"
}

variable "ssh_username" {
  type    = string
  default = "destrier"
}

variable "ssh_password" {
  type    = string
  default = "destrier"
}

source "qemu" "host" {
  accelerator      = var.accelerator
  # Paths are ${path.root}-relative so a build works from any directory.
  cd_files         = ["${path.root}/cloud-init/user-data", "${path.root}/cloud-init/meta-data"]
  cd_label         = "cidata"
  communicator     = "ssh"
  cpus             = 1
  disk_image       = true
  format           = "qcow2"
  headless         = true
  iso_checksum     = var.iso_checksum
  iso_url          = var.iso_url
  memory           = 1024
  output_directory = "${path.root}/output-signal-desk"
  shutdown_command = "echo '${var.ssh_password}' | sudo -S shutdown -P now"
  ssh_password     = var.ssh_password
  ssh_timeout      = "20m"
  ssh_username     = var.ssh_username
  # Keep the qcow2 suffix so the built disk is easy to identify and upload.
  vm_name          = "signal-desk.qcow2"
}

build {
  sources = ["source.qemu.host"]

  provisioner "shell" {
    execute_command = "sudo -E sh -c '{{ .Vars }} {{ .Path }}'"
    script          = "${path.root}/provision.sh"
  }
}
