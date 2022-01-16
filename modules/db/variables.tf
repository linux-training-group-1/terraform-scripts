variable "instance_name" {
  description = "Name of the Elastic Node VM"
  type = string
}

variable "machine_type" {
  description = "Supported machine type to install the nodes"
  type = string
}

variable "boot_family" {
  description = "Supported OS family to be installed"
  type = string
}

variable "boot_project" {
  description = "Supported OS project"
  type = string
}