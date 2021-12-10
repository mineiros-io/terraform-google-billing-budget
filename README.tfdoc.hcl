header {
  image = "https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg"
  url   = "https://mineiros.io/?ref=terraform-module-template"

  badge "build" {
    image = "https://github.com/mineiros-io/terraform-module-template/workflows/Tests/badge.svg"
    url   = "https://github.com/mineiros-io/terraform-module-template/actions"
    text  = "Build Status"
  }

  badge "semver" {
    image = "https://img.shields.io/github/v/tag/mineiros-io/terraform-module-template.svg?label=latest&sort=semver"
    url   = "https://github.com/mineiros-io/terraform-module-template/releases"
    text  = "GitHub tag (latest SemVer)"
  }

  badge "terraform" {
    image = "https://img.shields.io/badge/Terraform-1.x-623CE4.svg?logo=terraform"
    url   = "https://github.com/hashicorp/terraform/releases"
    text  = "Terraform Version"
  }

  badge "tf-aws-provider" {
    image = "https://img.shields.io/badge/AWS-3-F8991D.svg?logo=terraform"
    url   = "https://github.com/terraform-providers/terraform-provider-aws/releases"
    text  = "AWS Provider Version"
  }

  # badge "tf-gh" {
  #   image = "https://img.shields.io/badge/GH-4-F8991D.svg?logo=terraform"
  #   url = "https://github.com/terraform-providers/terraform-provider-github/releases"
  #   text = "Github Provider Version"
  # }

  # badge "tf-gcp-provider" {
  #   image = "https://img.shields.io/badge/google-4-1A73E8.svg?logo=terraform"
  #   url   = "https://github.com/terraform-providers/terraform-provider-google/releases"
  #   text  = "Google Provider Version"
  # }

  badge "slack" {
    image = "https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack"
    url   = "https://mineiros.io/slack"
    text  = "Join Slack"
  }
}

section {
  title   = "terraform-module-template"
  toc     = true
  content = <<-END
    A [Terraform] base module for [Amazon Web Services (AWS)][aws].

    **_This module supports Terraform version 1
    and is compatible with the Terraform AWS Provider version 3._**

    This module is part of our Infrastructure as Code (IaC) framework
    that enables our users and customers to easily deploy and manage reusable,
    secure, and production-grade cloud infrastructure.
  END

  section {
    title   = "Module Features"
    content = <<-END
      This module implements the following Terraform resources

      - `google_resource`
      - `google_something_else`

      and supports additional features of the following modules:

      - [mineiros-io/something/google](https://github.com/mineiros-io/terraform-google-something)
    END
  }

  section {
    title   = "Getting Started"
    content = <<-END
      Most common usage of the module:

      ```hcl
      module "terraform-module-template" {
        source = "git@github.com:mineiros-io/terraform-module-template.git?ref=v0.0.1"
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

        variable "module_tags" {
          type        = map(string)
          description = <<-END
            A map of tags that will be applied to all created resources that accept tags. Tags defined with 'module_tags' can be overwritten by resource-specific tags.
          END
          default     = {}
          readme_example = <<-END
            module_tags = {
              environment = "staging"
              team        = "platform"
            }
          END
        }

        variable "module_depends_on" {
          type        = any
          readme_type = "list(dependencies)"
          description = <<-END
            A list of dependencies. Any object can be _assigned_ to this list to define a hidden external dependency.
          END
          readme_example = <<-END
            module_depends_on = [
              aws_vpc.vpc
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

      - **`module_tags`**

        The map of tags that are being applied to all created resources that accept tags.
    END
  }

  section {
    title = "External Documentation"

    section {
      title   = "AWS Documentation IAM"
      content = <<-END
        - https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html
        - https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html
        - https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html
      END
    }

    section {
      title   = "Terraform AWS Provider Documentation"
      content = <<-END
        - https://www.terraform.io/docs/providers/aws/r/iam_role.html
        - https://www.terraform.io/docs/providers/aws/r/iam_role_policy.html
        - https://www.terraform.io/docs/providers/aws/r/iam_role_policy_attachment.html
        - https://www.terraform.io/docs/providers/aws/r/iam_instance_profile.html
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
    value = "https://mineiros.io/?ref=terraform-module-template"
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
  ref "releases-aws-provider" {
    value = "https://github.com/terraform-providers/terraform-provider-aws/releases"
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
  ref "aws" {
    value = "https://aws.amazon.com/"
  }
  ref "semantic versioning (semver)" {
    value = "https://semver.org/"
  }
  ref "variables.tf" {
    value = "https://github.com/mineiros-io/terraform-module-template/blob/main/variables.tf"
  }
  ref "examples/" {
    value = "https://github.com/mineiros-io/terraform-module-template/blob/main/examples"
  }
  ref "issues" {
    value = "https://github.com/mineiros-io/terraform-module-template/issues"
  }
  ref "license" {
    value = "https://github.com/mineiros-io/terraform-module-template/blob/main/LICENSE"
  }
  ref "makefile" {
    value = "https://github.com/mineiros-io/terraform-module-template/blob/main/Makefile"
  }
  ref "pull requests" {
    value = "https://github.com/mineiros-io/terraform-module-template/pulls"
  }
  ref "contribution guidelines" {
    value = "https://github.com/mineiros-io/terraform-module-template/blob/main/CONTRIBUTING.md"
  }
}
