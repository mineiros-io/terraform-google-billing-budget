generate_hcl "_generated_google.tf" {
  condition = global.provider == "google" || global.provider == "google-beta"
  content {
    variable "gcp_project" {
      type        = string
      description = "(Optional) The ID of the project in which the resource belongs."
      default     = null
    }

    variable "gcp_region" {
      type        = string
      description = "(Optional) The gcp region in which all resources will be created."
      default     = "europe-west3"
    }

    variable "gcp_org_domain" {
      type        = string
      description = "(Optional) The domain of the organization test projects should be created in."
      default     = null
    }

    variable "gcp_billing_account" {
      type        = string
      description = "(Optional) The billing account to use when creating projects."
      default     = "no-billing-account"
    }

    terraform {
      required_providers {
        google = {
          source  = "hashicorp/google"
          version = global.provider_version_constraint
        }
        google-beta = {
          source  = "hashicorp/google-beta"
          version = global.provider_version_constraint
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

    provider "random" {}

    resource "random_id" "suffix" {
      count       = local.test_name != "unit-disabled" ? 1 : 0
      byte_length = 16
    }

    data "google_project" "project" {
      count = var.gcp_project != null ? 1 : 0

      project_id = var.gcp_project
    }

    data "google_organization" "org" {
      count = var.gcp_org_domain != null ? 1 : 0

      domain = var.gcp_org_domain
    }

    # define default locals for all tests
    locals {
      test_name             = terramate.stack.path.basename
      random_suffix         = try(random_id.suffix[0].hex, "disabled")
      project_id            = try(data.google_project.project[0].project_id, "no-project")
      project_number        = try(data.google_project.project[0].number, null)
      org_domain            = try(data.google_organization.org[0].domain, "no-domain.mineiros.io")
      org_id                = try(data.google_organization.org[0].org_id, null)
      billing_account       = var.gcp_billing_account
      directory_customer_id = try(data.google_organization.org[0].directory_customer_id, "no-directoy-customer")
    }
  }
}
