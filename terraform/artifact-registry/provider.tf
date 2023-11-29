provider "google" {
  # Configuration options
  project     = "bien-prj"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "../key.json"
}