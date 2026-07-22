output "terraform_state_bucket" {
  value = module.s3_backend.bucket_name
}

output "terraform_lock_table" {
  value = module.s3_backend.dynamodb_table_name
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "ecr_repository_name" {
  value = module.ecr.repository_name
}