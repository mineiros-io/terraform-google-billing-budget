globals {
  minimum_terraform_version   = "1.0"

  provider                    = "google"
  minimum_provider_version    = "4.30"

  provider_version_constraint  = "~> ${global.minimum_provider_version}"
  terraform_version_constraint = "~> ${global.minimum_terraform_version}, != 1.1.0, != 1.1.1"
  # we exclude 1.1.0 and 1.1.1 because of:
  # https://github.com/hashicorp/terraform/blob/v1.1/CHANGELOG.md#112-december-17-2021
}
