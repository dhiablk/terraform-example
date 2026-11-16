resource "github_repository" "repo_for_each" {
  for_each    = toset(var.repo_names)
  name        = each.value
  description = "Repository ${each.value} created with for_each"
  visibility  = "public"
  auto_init   = true

  topics = ["terraform", "for_each", "example"]
}

resource "github_branch_protection" "protection_for_each" {
  for_each      = toset(var.repo_names)
  repository_id = github_repository.repo_for_each[each.value].node_id
  pattern       = "main"

  allows_deletions                = false
  allows_force_pushes             = false
  require_conversation_resolution = true
}

resource "github_issue_label" "label_for_each" {
  for_each = {
    for pair in setproduct(var.repo_names, var.label_names) :
    "${pair[0]}-${pair[1]}" => {
      repo  = pair[0]
      label = pair[1]
      idx   = index(var.label_names, pair[1])
    }
  }
  repository  = github_repository.repo_for_each[each.value.repo].name
  name        = each.value.label
  color       = var.label_colors[each.value.idx]
  description = each.value.label == "bug" ? "Bug issues" : "Feature requests"
}
