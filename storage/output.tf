output "tf_state_url" {
  value = google_storage_bucket.tf-state.url
}

output "tf_state_bucket" {
  value = google_storage_bucket.tf-state.name
}