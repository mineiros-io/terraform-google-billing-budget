// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT
// TERRAMATE: originated from generate_hcl block on /test/terramate_google.tm.hcl

variable "gcp_project" {
  default     = null
  description = "(Optional) The ID of the project in which the resource belongs."
  type        = string
}
variable "gcp_region" {
  default     = "europe-west3"
  description = "(Optional) The gcp region in which all resources will be created."
  type        = string
}
variable "gcp_org_domain" {
  default     = null
  description = "(Optional) The domain of the organization test projects should be created in."
  type        = string
}
variable "gcp_billing_account" {
  default     = "no-billing-account"
  description = "(Optional) The billing account to use when creating projects."
  type        = string
}
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.30"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.30"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}
provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}
provider "google-beta" {
  project = var.gcp_project
  region  = var.gcp_region
}
provider "random" {
}
resource "random_id" "suffix" {
  byte_length = 16
  count       = local.test_name != "unit-disabled" ? 1 : 0
}
data "google_project" "project" {
  count      = var.gcp_project != null ? 1 : 0
  project_id = var.gcp_project
}
data "google_organization" "org" {
  count  = var.gcp_org_domain != null ? 1 : 0
  domain = var.gcp_org_domain
}
locals {
  billing_account       = var.gcp_billing_account
  directory_customer_id = try(data.google_organization.org[0].directory_customer_id, "no-directoy-customer")
  org_domain            = try(data.google_organization.org[0].domain, "no-domain.mineiros.io")
  org_id                = try(data.google_organization.org[0].org_id, null)
  project_id            = try(data.google_project.project[0].project_id, "no-project")
  project_number        = try(data.google_project.project[0].number, null)
  random_suffix         = try(random_id.suffix[0].hex, "disabled")
  test_name             = "unit-disabled"
}
