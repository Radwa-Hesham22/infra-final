resource "google_service_account" "service_account" {
  account_id   = "service-account-id"
  
}

resource "google_project_iam_member" "role1" {
  project = "quick-asset-377911"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "role2" {
  project = "quick-asset-377911"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}