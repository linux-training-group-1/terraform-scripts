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

variable "ssh_params" {
  description = "keys required to set the ssh connection with the compute instances"
  type = object({
    user = string
    public_path = string
    private_path = string
  })
}

variable "ansible_playbook" {
  description = "path to the ansible playbook that need to be configured on the compute instance"
  type = string
}