# Terraform GitHub Module

## Overview

The Terraform GitHub module was developed to automate the creation of repositories on GitHub using Terraform.

## Requirements

Before you begin, you will need the following prerequisites installed:

- [Terraform](https://www.terraform.io/downloads.html) (v1.3.9 or higher)
- [GitHub Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) with the necessary permissions

## Usage

### Basic Example

```hcl
module "github_repo" {
  source  = "github.com/Guerlielton/terraform-github-module"
  organization = "devops"   
  team_name = "devops"
  repo_name = ["new-repository"]
  repo_description = "Description of the new repository"
}

```

### Parameters

- `repo_name` (required): The name of the repository to be created.
- `repo_description` (optional): A description for the repository.
- `organization` (require): The name of the organization on GitHub
- `team_name` (required): The team name of the organization such as DevOps, DevTeam
## Outputs

- `repo_url`: The URL of the newly created repository.

## Contributing

If you want to contribute to this project, please follow these steps:

1. Fork the project
2. Create a branch for your fix or feature (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Open a pull request

## Issues and Suggestions

To report issues or provide suggestions, use the [GitHub issues page](https://github.com/Guerlielton/terraform-github-module/issues).

## License

This project is licensed under the [MIT License](LICENSE).