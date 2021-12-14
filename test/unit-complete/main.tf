# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COMPLETE FEATURES UNIT TEST
# This module tests a complete set of most/all non-exclusive features
# The purpose is to activate everything the module offers, but trying to keep execution time and costs minimal.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

variable "gcp_region" {
  type        = string
  description = "(Required) The gcp region in which all resources will be created."
}

variable "billing_account" {
  type        = string
  description = "(Required) ID of the billing account to set a budget on."
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  region = var.gcp_region
}

# DO NOT RENAME MODULE NAME
module "test" {
  source = "../.."

  module_enabled = true

  # add all required arguments
  display_name    = "terraform-google-billing-budget-unit-complete"
  billing_account = var.billing_account
  amount          = 1000
  currency_code   = "EUR"
  threshold_rules = [
    {
      threshold_percent = 1.0
    },
    {
      threshold_percent = 1.0
      spend_basis       = "FORECASTED_SPEND"
    }
  ]

  # add all optional arguments that create additional resources

  # add most/all other optional arguments
  module_timeouts = {
    google_billing_budget = {
      create = "10m"
      update = "10m"
      delete = "10m"
    }
  }

  module_depends_on = ["nothing"]
}

# outputs generate non-idempotent terraform plans so we disable them for now unless we need them.
# output "all" {
#   description = "All outputs of the module."
#   value       = module.test
# }
