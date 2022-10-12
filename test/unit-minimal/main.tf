# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# MINIMAL FEATURES UNIT TEST
# This module tests a minimal set of features.
# The purpose is to test all defaults for optional arguments and just provide the required arguments.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module "test" {
  source = "../.."

  # add only required arguments and no optional arguments
  billing_account = local.billing_account

  amount = {
    last_period_amount = true
  }
  # threshold_rules = [
  #   {
  #     threshold_percent = 1.0
  #   },
  #   {
  #     threshold_percent = 1.0
  #     spend_basis       = "FORECASTED_SPEND"
  #   }
  # ]
}
