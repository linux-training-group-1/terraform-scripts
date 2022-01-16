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