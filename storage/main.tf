// connecting to gcp
provider "google" {
  credentials = file("../credentials.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}

// creating a gcs to store the remote state
// since gcs name is globally unique, define a unique name and use it initialize the back-end
resource "google_storage_bucket" "tf-state" {
  project = var.project
  location = var.region
  name = "${var.project}-tf-state"
  force_destroy = true
  versioning {
    enabled = true
  }
}