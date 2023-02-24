resource "google_compute_subnetwork" "subnet-1" {
  name          = "managed"
  ip_cidr_range = "10.0.0.0/24"
  region        = "asia-east1"
  network       = google_compute_network.vpc_network.id
  
}

resource "google_compute_subnetwork" "subnet-2" {
  provider = google-beta
  purpose = "PRIVATE"
  name          = "restricted"
  ip_cidr_range = "10.0.1.0/24"
  region        = "asia-east1"
  network       = google_compute_network.vpc_network.id
  
}