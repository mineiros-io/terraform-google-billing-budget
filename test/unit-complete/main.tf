# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COMPLETE FEATURES UNIT TEST
# This module tests a complete set of most/all non-exclusive features
# The purpose is to activate everything the module offers, but trying to keep execution time and costs minimal.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module "test" {
  source = "../.."

  module_enabled = true

  # add all required arguments
  display_name    = "terraform-google-billing-budget-unit-complete"
  billing_account = local.billing_account

  amount = {
    last_period_amount = true
  }
  threshold_rules = [
    {
      threshold_percent = 1.0
    },
    {
      threshold_percent = 1.0
      spend_basis       = "FORECASTED_SPEND"
    }
  ]

  budget_filter = {
    projects               = ["projects/1234567890"]
    credit_types_treatment = "INCLUDE_SPECIFIED_CREDITS"
    credit_types           = "COMMITTED_USAGE_DISCOUNT"
    services               = ["services/example-service"]
    subaccounts            = ["billingAccounts/1234567890"]
    labels = {
      Environment = "unit-complete"
    }
  }

  notifications = {
    pubsub_topic   = "alert-notification-topic"
    schema_version = "1.1"
    monitoring_notification_channels = [
      "projects/sample-project/example-alert-notification",
    ]
    disable_default_iam_recipients = true
  }



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

module "test1" {
  source = "../.."

  module_enabled = true

  # add all required arguments
  display_name    = "terraform-google-billing-budget-unit-complete"
  billing_account = local.billing_account

  amount = {
    specified_amount = {
      currency_code = "USD"
      units         = 100
      nanos         = 100
    }
  }
  threshold_rules = [
    {
      threshold_percent = 1.0
    },
    {
      threshold_percent = 1.0
      spend_basis       = "FORECASTED_SPEND"
    }
  ]

  budget_filter = {
    projects               = ["projects/1234567890"]
    credit_types_treatment = "INCLUDE_SPECIFIED_CREDITS"
    credit_types           = "COMMITTED_USAGE_DISCOUNT"
    services               = ["services/example-service"]
    subaccounts            = ["billingAccounts/1234567890"]
    labels = {
      Environment = "unit-complete"
    }
  }

  notifications = {
    pubsub_topic   = "alert-notification-topic"
    schema_version = "1.1"
    monitoring_notification_channels = [
      "projects/sample-project/example-alert-notification",
    ]
    disable_default_iam_recipients = true
  }



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

module "test2" {
  source = "../.."

  module_enabled = true

  # add all required arguments
  display_name    = "terraform-google-billing-budget-unit-complete"
  billing_account = local.billing_account

  amount = {
    specified_amount = {
      currency_code = "USD"
      nanos         = 100
    }
  }
  threshold_rules = [
    {
      threshold_percent = 1.0
    },
    {
      threshold_percent = 1.0
      spend_basis       = "FORECASTED_SPEND"
    }
  ]

  budget_filter = {
    projects               = ["projects/1234567890"]
    credit_types_treatment = "INCLUDE_SPECIFIED_CREDITS"
    credit_types           = "COMMITTED_USAGE_DISCOUNT"
    services               = ["services/example-service"]
    subaccounts            = ["billingAccounts/1234567890"]
    labels = {
      Environment = "unit-complete"
    }
  }

  notifications = {
    pubsub_topic   = "alert-notification-topic"
    schema_version = "1.1"
    monitoring_notification_channels = [
      "projects/sample-project/example-alert-notification",
    ]
    disable_default_iam_recipients = true
  }



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
