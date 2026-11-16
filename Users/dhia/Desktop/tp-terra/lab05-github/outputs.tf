output "development_repo" {
  description = "The name of the development repo"
  value       = github_repository.development.name
}

# Data source outputs (LAB-05)
output "current_user" {
  description = "Current GitHub user login (via data source)"
  value       = data.github_user.current.login
}

# Production repository outputs (LAB-05)
output "production_repo_url" {
  description = "URL of the production repository"
  value       = github_repository.production.html_url
}

output "production_environment" {
  description = "Production environment name"
  value       = github_repository_environment.production.environment
}
