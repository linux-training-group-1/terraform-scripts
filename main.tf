// connecting to gcp
provider "google" {
  credentials = file("gcp_service_account.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}

// creating 3 elastic nodes for high availability
module "elastic-node-1" {
  source        = "./modules/elk"
  instance_name = "elastic-node-1"
  boot_project  = var.elk_machine.boot_os_project
  boot_family   = var.elk_machine.boot_os_family
  machine_type  = var.elk_machine.machine_type
}

module "elastic-node-2" {
  source        = "./modules/elk"
  instance_name = "elastic-node-2"
  boot_project  = var.elk_machine.boot_os_project
  boot_family   = var.elk_machine.boot_os_family
  machine_type  = var.elk_machine.machine_type
}

module "elastic-node-3" {
  source        = "./modules/elk"
  instance_name = "elastic-node-3"
  boot_project  = var.elk_machine.boot_os_project
  boot_family   = var.elk_machine.boot_os_family
  machine_type  = var.elk_machine.machine_type
}

// creating 2 MySQL nodes for master-master replication
module "mysql-db-1" {
  source        = "./modules/db"
  instance_name = "mysql-db-1"
  boot_project  = var.elk_machine.boot_os_project
  boot_family   = var.elk_machine.boot_os_family
  machine_type  = var.elk_machine.machine_type
}

module "mysql-db-2" {
  source        = "./modules/db"
  instance_name = "mysql-db-2"
  boot_project  = var.elk_machine.boot_os_project
  boot_family   = var.elk_machine.boot_os_family
  machine_type  = var.elk_machine.machine_type
}