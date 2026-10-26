variable "github_owner" {
  description = "GitHub organization or user"
  type        = string
  default     = "mon-org"
}

# Development Repo Variables (LAB-04)
variable "dev_repository_name" {
  description = "Name of the Dev GitHub repository"
  type        = string
  default     = "development-repo"
}

variable "dev_repo_issues" {
  description = "Dev repo issues settings"
  type        = bool
  default     = true
}

variable "dev_discussions" {
  description = "Dev repo discussions settings"
  type        = bool
  default     = true
}

variable "dev_wiki" {
  description = "Dev repo wiki settings"
  type        = bool
  default     = true
}
