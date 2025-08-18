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

variable "invictus_project_id" {
  description = "Invictus Inc. GCP project ID"
  type = string
  default = "invictus-65"
}

variable "member1_project_id" {
  description = "Member 1 GCP project ID"
  type = string
  default = "service-p1-462917"
}

variable "member2_project_id" {
  description = "Member 2 GCP project ID"
  type = string
  default = "service-p2-462917"
}