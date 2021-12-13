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
    A [Terraform] module to manage [Google Billing Budgets](https://cloud.google.com/billing/docs/how-to/budgets) on [Google Cloud Services (GCP)](https://cloud.google.com).

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
        source = "git@github.com:mineiros-io/terraform-google-billing-budget.git?ref=v0.0.1"
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

        # please add main resource variables here

        # remove examples

        ### Example of a required variable
        #
        # variable "name" {
        #   required    = true
        #   type        = string
        #   description = <<-END
        #     The name of the resource
        #   END
        #   default     = "resource-name"
        # }

        ### Example of an optional variable
        #
        # variable "name" {
        #   type        = string
        #   description = <<-END
        #     The name of the resource
        #   END
        #   default     = "optional-resource-name"
        # }

        ### Example of an object
        #
        # variable "user" {
        #   type        = any
        #   readme_type = "object(user)"
        #   default     = {}
        #   readme_example = <<-END
        #     user = {
        #       name        = "marius"
        #       description = "The guy from Berlin."
        #     }
        #   END

        #   attribute "name" {
        #     required    = true
        #     type        = string
        #     description = <<-END
        #       The name of the user
        #     END
        #   }

        #   attribute "description" {
        #      type        = string
        #      description = <<-END
        #        A description describng the user in more detail
        #      END
        #      default     = ""
        #    }
        #  }
      }

      # section {
      #   title = "Extended Resource Configuration"
      #
      #   # please uncomment and add extended resource variables here (rsource not the main resource)
      # }

      section {
        title = "Module Configuration"

        variable "module_enabled" {
          type        = bool
          description = <<-END
            Specifies whether resources in the module will be created.
          END
          default     = true
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
        -https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_budget 
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
