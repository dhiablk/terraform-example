output "unique_teams" {
  description = "Teams without duplicates"
  value       = local.unique_teams
}

output "teams_upper" {
  description = "Teams in uppercase"
  value       = local.teams_upper
}

output "teams_lower" {
  description = "Teams in lowercase"
  value       = local.teams_lower
}

output "first_subnet" {
  description = "First subnet CIDR"
  value       = local.first_subnet
}

output "last_subnet" {
  description = "Last subnet CIDR"
  value       = local.last_subnet
}

output "subnet_count" {
  description = "Number of subnets"
  value       = local.subnet_count
}

output "az_count" {
  description = "Number of availability zones"
  value       = local.az_count
}

output "sorted_teams" {
  description = "Teams sorted alphabetically"
  value       = local.sorted_teams
}

output "joined_teams" {
  description = "Teams joined as string"
  value       = local.joined_teams
}

output "reversed_azs" {
  description = "Availability zones reversed"
  value       = local.reversed_azs
}

output "bucket_name" {
  description = "S3 bucket name using functions"
  value       = aws_s3_bucket.functions_demo.id
}