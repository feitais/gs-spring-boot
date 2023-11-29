terraform {
  backend "gcs" {
    bucket      = "bien-prj-backend-tf"
    prefix      = "terraform/state"
    credentials = "../key.json"
  }
}