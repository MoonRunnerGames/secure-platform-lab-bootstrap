locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
    purpose     = "terraform-state"
    test = "test tag"
  }

  storage_account_name = lower(replace("st${var.project_name}${var.storage_account_suffix}", "-", ""))
  github_owner         = "MoonRunnerGames"
  github_repo          = "secure-platform-lab-infra"
}