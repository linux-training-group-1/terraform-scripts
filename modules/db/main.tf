// defining a linux OS for the node
data "google_compute_image" "linux_image" {
  project = var.boot_project
  family = var.boot_family
}

// creating an elastic node
resource "google_compute_instance" "mysql_instance" {
  name = var.instance_name
  machine_type = var.machine_type
  tags = ["mysql"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.linux_image.self_link
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    ssh-keys = "${var.ssh_params.user}:${file("${var.ssh_params.public_path}")}"
  }

  #  // establish SSH connection to the remote server
#  provisioner "remote-exec" {
#    inline = ["echo 'connected to ssh'"]
#
#    connection {
#      type        = "ssh"
#      user        = "${var.ssh_params.user}"
#      private_key = "${file("${var.ssh_params.private_path}")}"
#    }
#  }
#
#  // execute the ansible playbook via SSH
#  provisioner "local-exec" {
#    command = "ansible-playbook -i '${google_compute_instance.mysql_instance.network_interface.0.access_config.nat_ip},' --private-key ${var.ssh_params.private_path} ../ansible/${var.ansible_playbook}"
#  }
}