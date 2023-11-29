resource "google_artifact_registry_repository" "bien-repository" {
  location      = "us-central1"
  repository_id = "bien-repository"
  description   = "bien-prj images repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = false
  }
}
