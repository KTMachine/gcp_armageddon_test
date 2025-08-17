# Cloud Run Service URL
output "cloud_run_service_url" {
  value = google_cloud_run_service.app.status[0].url
  description = "The publicly accessible URL of the Cloud Run Service"
}

# Service IAM Role Policy (Confirms public access)
output "cloud_run_public_access" {
  value = google_cloud_run_service_iam_member.public_access.member
  description = "Shows if public access is enabled ('allUsers')"
}

# Service Location
output "cloud_run_location" {
  value = google_cloud_run_service.dev_app.location
  description = "Deployment region of the Cloud Run service"
}

# Latest Revision Status
output "latest_revision_status" {
  value = google_cloud_run_service.dev_app.status[0].condtions[0].status
  description = "Health status of the latest revision ('True' = healthy)"
}