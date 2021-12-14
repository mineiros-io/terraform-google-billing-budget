header {
  image = "https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg"
  url   = "https://mineiros.io/?ref=terraform-google-billing-budget"

  badge "build" {
    image = "https://github.com/mineiros-io/terraform-google-billing-budget/workflows/Tests/badge.svg"
    url   = "https://github.com/mineiros-io/terraform-google-billing-budget/actions"
    text  = "Build Status"
  }

  badge "semver" {
    image = "https://img.shields.io/github/v/tag/mineiros-io/terraform-google-billing-budget.svg?label=latest&sort=semver"
    url   = "https://github.com/mineiros-io/terraform-google-billing-budget/releases"
    text  = "GitHub tag (latest SemVer)"
  }

  badge "terraform" {
    image = "https://img.shields.io/badge/Terraform-1.x-623CE4.svg?logo=terraform"
    url   = "https://github.com/hashicorp/terraform/releases"
    text  = "Terraform Version"
  }

   badge "tf-gcp-provider" {
     image = "https://img.shields.io/badge/google-4-1A73E8.svg?logo=terraform"
     url   = "https://github.com/terraform-providers/terraform-provider-google/releases"
     text  = "Google Provider Version"
   }

  badge "slack" {
    image = "https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack"
    url   = "https://mineiros.io/slack"
    text  = "Join Slack"
  }
}

section {
  title   = "terraform-google-billing-budget"
  toc     = true
  content = <<-END
    A [Terraform] module to manage [Google Billing Budgets](https://cloud.google.com/billing/docs/how-to/budgets) on [Google Cloud Platform (GCP)](https://cloud.google.com).

    A budget enables you to track your actual Google Cloud spend against your
    planned spend. After you've set a budget amount, you set budget alert
    threshold rules that are used to trigger notifications such as email, slack and Pub/Sub.

    **_This module supports Terraform version 1
    and is compatible with the Terraform Google Cloud Provider version 4._**

    This module is part of our Infrastructure as Code (IaC) framework
    that enables our users and customers to easily deploy and manage reusable,
    secure, and production-grade cloud infrastructure.
  END

  section {
    title   = "Module Features"
    content = <<-END
      This module implements the following Terraform resources

      - `google_billing_budget`
    END
  }

  section {
    title   = "Getting Started"
    content = <<-END
      Most common usage of the module:

      ```hcl
      module "terraform-google-billing-budget" {
        source  = "mineiros-io/billing-budget/google"
        version = "0.0.1"

        display_name    = "example-alert"
        billing_account = "xxxxxxxx-xxxx-xxxxxxx"
        amount          = 1000
        currency_code   = "EUR"
        treshold_rules = [
          {
            threshold_percent = 1.0
          },
          {
            threshold_percent = 1.0
            spend_basis       = "FORECASTED_SPEND"
          }
        ]
      }
      ```
    END
  }

  section {
    title   = "Module Argument Reference"
    content = <<-END
      See [variables.tf] and [examples/] for details and use-cases.
    END

    section {
      title = "Top-level Arguments"

      section {
        title = "Main Resource Configuration"

        variable "billing_account" {
          required    = true
          type        = string
          description = <<-END
            ID of the billing account to set a budget on. 
          END
        }

        variable "amount" {
          required    = true
          type        = number
          description = <<-END
            A specified amount to use as the budget.
          END
        }

        variable "threshold_rules" {
          type        = any
          readme_type = "list(threshold_rules)"
          readme_example = <<-END
            treshold_rules = [
              {
                threshold_percent = 1.0
              },
              {
                threshold_percent = 1.0
                spend_basis       = "FORECASTED_SPEND"
              }
            ]
          END

          attribute "threshold_percent" {
            required    = true
            type        = number
            description = <<-END
              Send an alert when this threshold is exceeded. This is a 1.0-based percentage, so 0.5 = 50%. Must be >= 0.
            END
          }

          attribute "spend_basis" {
            type        = string
            description = <<-END
              The type of basis used to determine if spend has passed the threshold. Default value is `CURRENT_SPEND`. Possible values are `CURRENT_SPEND` and `FORECASTED_SPEND`.
            END
         }
       }

        variable "currency_code" {
          type        = string
          description = <<-END
            The 3-letter currency code defined in ISO 4217. If specified, it must match the currency of the billing account. For a list of currency codes, please see https://en.wikipedia.org/wiki/ISO_4217
          END
          default = null
        }

        variable "display_name" {
          type        = string
          description = <<-END
            The name of the budget that will be displayed in the GCP console. Must be <= 60 chars.
          END
          default     = null
        }


        variable "budget_filter" {
          type        = any
          description = <<-END
            Filters that define which resources are used to compute the actual spend against the budget.
          END
          readme_type = "object(budget_filter)"
          default     = null
          readme_example = <<-END
            user = {
              projects               = ["projects/xxx"]
              credit_types_treatment = "INCLUDE_SPECIFIED_CREDITS"
              credit_types           = "COMMITTED_USAGE_DISCOUNT"
              services               = ["services/example-service"]
              subaccounts            = ["billingAccounts/xxx"]
              labels                 = {
                Environment = "Dev"
              }
            }
          END

          attribute "projects" {
            type        = set(string)
            description = <<-END
              A set of projects of the form `projects/{project_number}`, specifying that usage from only this set of projects should be included in the budget. If omitted, the report will include all usage for the billing account, regardless of which project the usage occurred on.
            END
            default     = null
          }

          attribute "credit_types_treatment" {
            type        = string
            description = <<-END
              Specifies how credits should be treated when determining spend for threshold calculations. Possible values are `INCLUDE_ALL_CREDITS`, `EXCLUDE_ALL_CREDITS`, and `INCLUDE_SPECIFIED_CREDITS`.
            END
            default     = "INCLUDE_ALL_CREDITS"
          }

          attribute "credit_types" {
            type        = string
            description = <<-END
              If `credit_types_treatment` is set to `INCLUDE_SPECIFIED_CREDITS`, this is a list of credit types to be subtracted from gross cost to determine the spend for threshold calculations. See [a list of acceptable credit type values](https://cloud.google.com/billing/docs/how-to/export-data-bigquery-tables#credits-type)
            END
            default     = null
          }

          attribute "services" {
            type        = set(string)
            description = <<-END
              A set of services of the form `services/{service_id}`, specifying that usage from only this set of services should be included in the budget. If omitted, the report will include usage for all the services. For a list of available services please see: https://cloud.google.com/billing/v1/how-tos/catalog-api.
            END
            default     = null
          }

          attribute "subaccounts" {
            type        = set(string)
            description = <<-END
              A set of subaccounts of the form `billingAccounts/{account_id}`, specifying that usage from only this set of subaccounts should be included in the budget. If a subaccount is set to the name of the parent account, usage from the parent account will be included. If the field is omitted, the report will include usage from the parent account and all subaccounts, if they exist.
            END
            default     = null
          }

          attribute "labels" {
            type        = map(string)
            description = <<-END
              A single label and value pair specifying that usage from only this set of labeled resources should be included in the budget.
            END
            default     = null
          }
        }

        variable "notifications" {
          type        = any
          description = <<-END
            Defines notifications that are sent on every update to the billing account's spend, regardless of the thresholds defined using threshold rules.
          END

          readme_type = "object(notifications)"
          default     = null
          readme_example = <<-END
            notifications = {
              pubsub_topic                     = "alert-notification-topic"
              monitoring_notification_channels = [
                "projects/sample-project/example-alert-notification",
              ]
              disable_default_iam_recipients   = true
            }
          END

          attribute "pubsub_topic" {
            type        = string
            description = <<-END
              The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form `projects/{project_id}/topics/{topic_id}`. Updates are sent at regular intervals to the topic.
            END
            default     = null
         }

          attribute "schema_version" {
            type        = string
            description = <<-END
              The schema version of the notification. It represents the JSON schema as defined in https://cloud.google.com/billing/docs/how-to/budgets#notification_format.
            END
            default     = "1.0"
          }

          attribute "monitoring_notification_channels" {
            type        = set(string)
            description = <<-END
              The full resource name of a monitoring notification channel in the form `projects/{project_id}/notificationChannels/{channel_id}`. A maximum of 5 channels are allowed.
            END
            default     = null
          }

          attribute "disable_default_iam_recipients" {
            type        = bool
            description = <<-END
              When set to true, disables default notifications sent when a threshold is exceeded. Default recipients are those with Billing Account Administrators and Billing Account Users IAM roles for the target account.
            END
            default     = null
          }
        }
      }
 
      section {
        title = "Module Configuration"

        variable "module_enabled" {
          type        = bool
          description = <<-END
            Specifies whether resources in the module will be created.
          END
          default     = true
        }

        variable "module_timeouts" {
          type        = any
          readme_type = "object(google_billing_budget)"
          description = <<-END
            How long certain operations (per resource type) are allowed to take before being considered to have failed.
          END
          default = {}
          readme_example = <<-END
            module_timeouts = {
              google_billing_budget = {
                create = "4m"
                update = "4m"
                delete = "4m"
              }
            }
          END

          attribute "google_billing_budget" {
            type        = any
            readme_type = "object(timeouts)"
            description = <<-END
              Timeout for the `google_billing_budget` resource.
            END
            default =  null

            attribute "create" {
              type        = string
              description = <<-END
                Timeout for `create` operations.
              END
              default = null
            }

            attribute "update" {
              type        = string
              description = <<-END
                Timeout for `update` operations.
              END
              default = null
            }

            attribute "delete" {
              type        = string
              description = <<-END
                Timeout for `delete` operations.
              END
              default = null
            }
          }
        }

        variable "module_depends_on" {
          type        = any
          readme_type = "list(dependencies)"
          description = <<-END
            A list of dependencies. Any object can be _assigned_ to this list to define a hidden external dependency.
          END
          readme_example = <<-END
            module_depends_on = [
              google_monitoring_notification_channel.notification_channel 
            ]
          END
        }
      }
    }
  }

  section {
    title   = "Module Attributes Reference"
    content = <<-END
      The following attributes are exported in the outputs of the module:

      - **`module_enabled`**

        Whether this module is enabled.
    END
  }

  section {
    title = "External Documentation"

    section {
      title   = "GCP Billing Budgets Documentation"
      content = <<-END
        - https://cloud.google.com/billing/docs/how-to/budgets
      END
    }

    section {
      title   = "Terraform GCP Provider Documentation"
      content = <<-END
        - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_budget 
      END
    }
  }

  section {
    title   = "Module Versioning"
    content = <<-END
      This Module follows the principles of [Semantic Versioning (SemVer)].

      Given a version number `MAJOR.MINOR.PATCH`, we increment the:

      1. `MAJOR` version when we make incompatible changes,
      2. `MINOR` version when we add functionality in a backwards compatible manner, and
      3. `PATCH` version when we make backwards compatible bug fixes.
    END

    section {
      title   = "Backwards compatibility in `0.0.z` and `0.y.z` version"
      content = <<-END
        - Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
        - Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)
      END
    }
  }

  section {
    title   = "About Mineiros"
    content = <<-END
      [Mineiros][homepage] is a remote-first company headquartered in Berlin, Germany
      that solves development, automation and security challenges in cloud infrastructure.

      Our vision is to massively reduce time and overhead for teams to manage and
      deploy production-grade and secure cloud infrastructure.

      We offer commercial support for all of our modules and encourage you to reach out
      if you have any questions or need help. Feel free to email us at [hello@mineiros.io] or join our
      [Community Slack channel][slack].
    END
  }

  section {
    title   = "Reporting Issues"
    content = <<-END
      We use GitHub [Issues] to track community reported issues and missing features.
    END
  }

  section {
    title   = "Contributing"
    content = <<-END
      Contributions are always encouraged and welcome! For the process of accepting changes, we use
      [Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].
    END
  }

  section {
    title   = "Makefile Targets"
    content = <<-END
      This repository comes with a handy [Makefile].
      Run `make help` to see details on each available target.
    END
  }

  section {
    title   = "License"
    content = <<-END
      [![license][badge-license]][apache20]

      This module is licensed under the Apache License Version 2.0, January 2004.
      Please see [LICENSE] for full details.

      Copyright &copy; 2020-2022 [Mineiros GmbH][homepage]
    END
  }
}

references {
  ref "homepage" {
    value = "https://mineiros.io/?ref=terraform-google-billing-budget"
  }
  ref "hello@mineiros.io" {
    value = " mailto:hello@mineiros.io"
  }
  ref "badge-license" {
    value = "https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg"
  }
  ref "releases-terraform" {
    value = "https://github.com/hashicorp/terraform/releases"
  }
  ref "apache20" {
    value = "https://opensource.org/licenses/Apache-2.0"
  }
  ref "slack" {
    value = "https://mineiros.io/slack"
  }
  ref "terraform" {
    value = "https://www.terraform.io"
  }
  ref "gcp" {
    value = "https://cloud.google.com"
  }
  ref "semantic versioning (semver)" {
    value = "https://semver.org/"
  }
  ref "variables.tf" {
    value = "https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/variables.tf"
  }
  ref "examples/" {
    value = "https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/examples"
  }
  ref "issues" {
    value = "https://github.com/mineiros-io/terraform-google-billing-budget/issues"
  }
  ref "license" {
    value = "https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/LICENSE"
  }
  ref "makefile" {
    value = "https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/Makefile"
  }
  ref "pull requests" {
    value = "https://github.com/mineiros-io/terraform-google-billing-budget/pulls"
  }
  ref "contribution guidelines" {
    value = "https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/CONTRIBUTING.md"
  }
}
