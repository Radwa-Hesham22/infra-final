
resource "google_compute_instance" "private" {
  name = "private-vm"
  machine_type = "e2-micro"
  zone = "asia-east1-b"
  tags = ["ssh"]
boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  
network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnet-1.name
  }

metadata_startup_script = "sudo apt-get update\nsudo apt-get install kubectl\nsudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin\n"

}