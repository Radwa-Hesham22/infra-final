resource "google_compute_router" "nat-router" {
  name = "nat-router"
  region = "asia-east1"
  network = google_compute_network.vpc_network.name
}
resource "google_compute_router_nat" "nat-gateway" {
  name = "nat-gateway"
  region = "asia-east1"
  router = google_compute_router.nat-router.name
  nat_ip_allocate_option = "AUTO_ONLY"
  #nat_ips = [ google_compute_address.nat-ip.self_link ]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  /*subnetwork {
    name                    = google_compute_subnetwork.subnet-1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }*/
     
}