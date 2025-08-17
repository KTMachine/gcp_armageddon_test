# Variables for the Terraform configuration
variable "cloud_run_image" {
  description = "Container image for Cloud Run"
  type = string
  default = "gcr.io/google-samples/hello-app:2.0"
}

variable "cloud_run_region" {
  description = "Deployment region for Cloud Run"
  type = string
  default = "us-central1"
}

variable "allow_public_access" {
  description = "Whether to allow unauthenticated access"
  type = bool
  default = true
}