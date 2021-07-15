# - PROVIDER - #
provider "google" {
  project     = var.gcp_project
  region      = var.gcp_region
}

# - VARIABLES - #

variable "gcp_project" {
  description = "GCP project name"
}

variable "gcp_region" {
  description = "GCP region, e.g. us-east1"
  default = "us-east1"
}

variable "gcp_zone" {
  description = "GCP zone, e.g. us-east1-a"
  default = "us-east1-b"
}

variable "machine_type" {
  description = "GCP machine type"
  default = "n1-standard-1"
}

variable "instance_name" {
  description = "GCP instance name"
  default = "nyoung-gcp-demo"
}

variable "image" {
  description = "image to build instance from"
  default = "debian-cloud/debian-9"
}

# - RESOURCES - #

resource "google_compute_instance" "demo" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  
  labels = {
    name = "gcp-instance",
    department = "devops"
  }

}

# - OUTPUT - #

output "external_ip"{
  value = "Root Directory - ${google_compute_instance.demo.network_interface.0.access_config.0.nat_ip}"
}
