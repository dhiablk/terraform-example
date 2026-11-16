output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "bucket_names" {
  description = "Names of created S3 buckets"
  value       = aws_s3_bucket.buckets[*].id
}

output "bucket_count" {
  description = "Number of S3 buckets created"
  value       = length(var.s3_buckets)
}