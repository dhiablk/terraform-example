output "repository_url" {
  description = "URL of the created repository"
  value       = github_repository.main.html_url
}

output "repository_name" {
  description = "Name of the created repository"
  value       = github_repository.main.name
}

output "default_branch" {
  description = "Default branch"
  value       = var.default_branch
}