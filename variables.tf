variable "organization" {
  description = "(Required) This is the target GitHub organization"
  type        = string
}

variable "team_name" {
  description = "The team's full name"
  type        = string
}

variable "repo_name" {
  description = "Repo name"
  type        = list(string)
}

variable "repo_description" {
  description = "Description to repo"
  type        = string
}

variable "repo_template_name" {
  description = "Template name"
  type        = string
  default     = ""
}