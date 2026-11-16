output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.example.id
}

output "role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.example.name
}

output "policy_name" {
  description = "Name of the IAM policy"
  value       = aws_iam_policy.example.name
}

output "attachment_id" {
  description = "ID of the role-policy attachment"
  value       = aws_iam_role_policy_attachment.example.id
}