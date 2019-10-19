provider "google" {
  credentials = "${file("service_account.json")}"
  project     = "my-project-id"
  region      = "us-central1"
}
resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  network_interface {
     network = "default"

     access_config {
       // Ephemeral IP
     }
   }


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
}
