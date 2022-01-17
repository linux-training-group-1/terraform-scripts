variable "project" {
  description = "project id of the gcp"
  type        = string
}

variable "region" {
  default = "us-central1"
  type    = string
}

variable "zone" {
  default = "us-central1-a"
  type    = string
}

variable "ssh_params" {
  description = "keys required to set the ssh connection with the compute instances"
  type = object({
    user = string
    public_path = string
    private_path = string
  })
}

variable "elk_machine" {
  description = "parameters for the VM instance of ELK nodes"
  type = object({
    machine_type    = string
    boot_os_project = string
    boot_os_family  = string
  })
}

variable "mysql_machine" {
  description = "parameters for the VM instance of MySQL nodes"
  type = object({
    machine_type    = string
    boot_os_project = string
    boot_os_family  = string
  })
}
