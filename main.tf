data "github_team" "team" {
  slug = var.team_name
}

resource "github_repository" "repo_name" {
  count       = length(var.repo_name)
  name        = var.repo_name[count.index]
  description = var.repo_description
  visibility  = "private"
  has_issues  = true
  auto_init   = true
}

resource "github_branch" "create_branch" {
  count         = length(var.repo_name)
  repository    = github_repository.repo_name.*.name[count.index]
  branch        = "homol"
  source_branch = github_repository.repo_name.*.default_branch[count.index]
}

resource "github_team_repository" "manage_access_repo" {
  count      = length(var.repo_name)
  team_id    = data.github_team.team.id
  repository = github_repository.repo_name.*.name[count.index]
  permission = "push"
}


resource "github_branch_protection_v3" "branch_protect_main" {
  count                           = length(var.repo_name)
  repository                      = github_repository.repo_name.*.name[count.index]
  branch                          = github_repository.repo_name.*.default_branch[count.index]
  require_conversation_resolution = true


  required_status_checks {
    strict   = true
  }

  required_pull_request_reviews {
    require_code_owner_reviews = true
    dismiss_stale_reviews      = true
    required_approving_review_count = 2
  }

}


resource "github_branch_protection_v3" "branch_protect_homol" {
  count                           = length(var.repo_name)
  repository                      = github_repository.repo_name.*.name[count.index]
  branch                          = github_branch.create_branch.*.branch[count.index]
  require_conversation_resolution = true

  required_status_checks {
    strict   = true
  }

  required_pull_request_reviews {
    require_code_owner_reviews = true
    dismiss_stale_reviews      = true
    required_approving_review_count = 2
  }
  depends_on = [
    github_branch.create_branch
  ]
}

output "repo_url" {
  value = github_repository.repo_name.html_url
}