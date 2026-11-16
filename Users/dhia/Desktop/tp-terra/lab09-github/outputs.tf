output "repository_urls" {
  description = "URLs of the created repositories"
  value       = github_repository.repo_for_each[*].html_url
}

output "repository_names" {
  description = "Names of the created repositories"
  value       = github_repository.repo_for_each[*].name
}

output "protection_repository_ids" {
  description = "IDs of repositories with branch protection"
  value       = github_branch_protection.protection_for_each[*].repository_id
}
