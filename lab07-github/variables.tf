variable "github_owner" {
  description = "GitHub username or organization owning the repositories"
  type        = string
  default     = "mon-org"
}

variable "environment" {
  description = "Environment name for resource naming"
  type        = string
  default     = "dev"
}
