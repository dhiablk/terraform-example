output "primary_bucket_name" {
  description = "Name of the primary region S3 bucket"
  value       = aws_s3_bucket.primary.id
}

output "primary_bucket_region" {
  description = "Primary region"
  value       = var.primary_region
}

output "secondary_bucket_name" {
  description = "Name of the secondary region S3 bucket"
  value       = aws_s3_bucket.secondary.id
}

output "secondary_bucket_region" {
  description = "Secondary region"
  value       = var.secondary_region
}