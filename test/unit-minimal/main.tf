# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# MINIMAL FEATURES UNIT TEST
# This module tests a minimal set of features.
# The purpose is to test all defaults for optional arguments and just provide the required arguments.
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
      version = "4.6"
    }
  }
}

provider "google" {
  region = var.gcp_region
}

# DO NOT RENAME MODULE NAME
module "test" {
  source = "../.."

  # add only required arguments and no optional arguments
  billing_account        = var.billing_account
  use_last_period_amount = true
  threshold_rules = [
    {
      threshold_percent = 1.2
    },
  ]
}

# outputs generate non-idempotent terraform plans so we disable them for now unless we need them.
# output "all" {
#   description = "All outputs of the module."
#   value       = module.test
# }
