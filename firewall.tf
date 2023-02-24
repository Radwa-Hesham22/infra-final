
resource "google_compute_firewall" "allow-ssh" {
  name = "allow-ssh"
  network = google_compute_network.vpc_network.name
  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
    
  }
  source_tags = ["ssh"]
  source_ranges = ["0.0.0.0/0"]
}