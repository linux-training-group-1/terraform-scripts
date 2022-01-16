// defining a linux OS for the node
data "google_compute_image" "linux_image" {
  project = "debian-cloud"
  family = "debian-10"
}

// creating an elastic node
resource "google_compute_instance" "vm_instance" {
  name = var.instance_name
  machine_type = var.machine_type
  tags = ["https-server"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.linux_image.self_link
    }
  }

  network_interface {
    network = "default"
  }
}