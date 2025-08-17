# Cloud Run service deployment
resource "google_cloud_run_service" "app" {
  name = "dev-team-app"
  location = var.cloud_run_region

  template {
    spec {
      containers {
        image = var.cloud_run_image
      }
    }
  }
}

# Cloud Run IAM Public Access
resource "google_cloud_run_service_iam_member" "public_access" {
  service = google_cloud_run_service.app.name
  role = "roles/run.invoker"
  member = "allUsers"
}