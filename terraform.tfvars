// settings for GCP
project = "lt2021-g1-dr"

// settings for ssh connection
ssh_params = {
  user = "ansible"
  public_path = "/home/xenon/.ssh/id_ansible.pub"
  private_path = "/home/xenon/.ssh/id_ansible"
}

// settings for the ELK nodes
elk_machine = {
  machine_type    = "e2-micro"
  boot_os_project = "debian-cloud"
  boot_os_family  = "debian-10"
}

// settings for the MySQL nodes
mysql_machine = {
  machine_type    = "e2-micro"
  boot_os_project = "debian-cloud"
  boot_os_family  = "debian-10"
}