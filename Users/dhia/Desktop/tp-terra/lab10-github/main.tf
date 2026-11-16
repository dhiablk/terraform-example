resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "github_repository" "main" {
  name        = "terraform-${var.environment}-repo-${random_string.suffix.result}"
  description = "Terraform managed ${var.environment} repository"
  visibility  = var.repo_visibility
  auto_init   = true

  topics = ["terraform", "depends-on-demo"]
}

resource "github_repository_file" "readme" {
  repository          = github_repository.main.name
  branch              = var.default_branch
  file                = "README.md"
  content             = "# Terraform ${var.environment} Repository\n\nManaged by Terraform with explicit depends_on."
  commit_message      = "Add README"
  commit_author       = "Terraform"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
  depends_on          = [github_repository.main]
}

resource "github_issue_label" "bug" {
  repository  = github_repository.main.name
  name        = "bug"
  color       = "FF0000"
  description = "Bug reports"
  depends_on  = [github_repository.main]
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.main.node_id
  pattern       = var.default_branch

  allows_deletions                = false
  allows_force_pushes             = false
  require_conversation_resolution = true
  depends_on                      = [github_repository.main]
}