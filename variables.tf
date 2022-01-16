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

variable "elk_machine" {
  description = "parameters for the VM instance of ELK nodes"
  type = object({
    machine_type    = string
    boot_os_project = string
    boot_os_family  = string
  })
}

