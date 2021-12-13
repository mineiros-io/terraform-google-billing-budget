[<img src="https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg" width="400"/>](https://mineiros.io/?ref=terraform-google-billing-budget)

[![Build Status](https://github.com/mineiros-io/terraform-google-billing-budget/workflows/Tests/badge.svg)](https://github.com/mineiros-io/terraform-google-billing-budget/actions)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/mineiros-io/terraform-google-billing-budget.svg?label=latest&sort=semver)](https://github.com/mineiros-io/terraform-google-billing-budget/releases)
[![Terraform Version](https://img.shields.io/badge/Terraform-1.x-623CE4.svg?logo=terraform)](https://github.com/hashicorp/terraform/releases)
[![Google Provider Version](https://img.shields.io/badge/google-4-1A73E8.svg?logo=terraform)](https://github.com/terraform-providers/terraform-provider-google/releases)
[![Join Slack](https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack)](https://mineiros.io/slack)

# terraform-google-billing-budget

A [Terraform] module to manage [Google Billing Budgets](https://cloud.google.com/billing/docs/how-to/budgets) on [Google Cloud Services (GCP)](https://cloud.google.com).

A budget enables you to track your actual Google Cloud spend against your
planned spend. After you've set a budget amount, you set budget alert
threshold rules that are used to trigger notifications such as email, slack and Pub/Sub.

**_This module supports Terraform version 1
and is compatible with the Terraform Google Cloud Provider version 4._**

This module is part of our Infrastructure as Code (IaC) framework
that enables our users and customers to easily deploy and manage reusable,
secure, and production-grade cloud infrastructure.


- [Module Features](#module-features)
- [Getting Started](#getting-started)
- [Module Argument Reference](#module-argument-reference)
  - [Top-level Arguments](#top-level-arguments)
    - [Main Resource Configuration](#main-resource-configuration)
    - [Module Configuration](#module-configuration)
- [Module Attributes Reference](#module-attributes-reference)
- [External Documentation](#external-documentation)
  - [GCP Billing Budgets Documentation](#gcp-billing-budgets-documentation)
  - [Terraform GCP Provider Documentation](#terraform-gcp-provider-documentation)
- [Module Versioning](#module-versioning)
  - [Backwards compatibility in `0.0.z` and `0.y.z` version](#backwards-compatibility-in-00z-and-0yz-version)
- [About Mineiros](#about-mineiros)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [Makefile Targets](#makefile-targets)
- [License](#license)

## Module Features

This module implements the following Terraform resources

- `google_billing_budget`

## Getting Started

Most common usage of the module:

```hcl
module "terraform-google-billing-budget" {
  source = "git@github.com:mineiros-io/terraform-google-billing-budget.git?ref=v0.0.1"
}
```

## Module Argument Reference

See [variables.tf] and [examples/] for details and use-cases.

### Top-level Arguments

#### Main Resource Configuration

#### Module Configuration

- [**`module_enabled`**](#var-module_enabled): *(Optional `bool`)*<a name="var-module_enabled"></a>

  Specifies whether resources in the module will be created.

  Default is `true`.

- [**`module_depends_on`**](#var-module_depends_on): *(Optional `list(dependencies)`)*<a name="var-module_depends_on"></a>

  A list of dependencies. Any object can be _assigned_ to this list to define a hidden external dependency.

  Example:

  ```hcl
  module_depends_on = [
    google_monitoring_notification_channel.notification_channel 
  ]
  ```

## Module Attributes Reference

The following attributes are exported in the outputs of the module:

- **`module_enabled`**

  Whether this module is enabled.

## External Documentation

### GCP Billing Budgets Documentation

- https://cloud.google.com/billing/docs/how-to/budgets

### Terraform GCP Provider Documentation

-https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_budget

## Module Versioning

This Module follows the principles of [Semantic Versioning (SemVer)].

Given a version number `MAJOR.MINOR.PATCH`, we increment the:

1. `MAJOR` version when we make incompatible changes,
2. `MINOR` version when we add functionality in a backwards compatible manner, and
3. `PATCH` version when we make backwards compatible bug fixes.

### Backwards compatibility in `0.0.z` and `0.y.z` version

- Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
- Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)

## About Mineiros

[Mineiros][homepage] is a remote-first company headquartered in Berlin, Germany
that solves development, automation and security challenges in cloud infrastructure.

Our vision is to massively reduce time and overhead for teams to manage and
deploy production-grade and secure cloud infrastructure.

We offer commercial support for all of our modules and encourage you to reach out
if you have any questions or need help. Feel free to email us at [hello@mineiros.io] or join our
[Community Slack channel][slack].

## Reporting Issues

We use GitHub [Issues] to track community reported issues and missing features.

## Contributing

Contributions are always encouraged and welcome! For the process of accepting changes, we use
[Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].

## Makefile Targets

This repository comes with a handy [Makefile].
Run `make help` to see details on each available target.

## License

[![license][badge-license]][apache20]

This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE] for full details.

Copyright &copy; 2020-2022 [Mineiros GmbH][homepage]


<!-- References -->

[homepage]: https://mineiros.io/?ref=terraform-google-billing-budget
[hello@mineiros.io]: mailto:hello@mineiros.io
[badge-license]: https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg
[releases-terraform]: https://github.com/hashicorp/terraform/releases
[apache20]: https://opensource.org/licenses/Apache-2.0
[slack]: https://mineiros.io/slack
[terraform]: https://www.terraform.io
[gcp]: https://cloud.google.com
[semantic versioning (semver)]: https://semver.org/
[variables.tf]: https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/variables.tf
[examples/]: https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/examples
[issues]: https://github.com/mineiros-io/terraform-google-billing-budget/issues
[license]: https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/LICENSE
[makefile]: https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/Makefile
[pull requests]: https://github.com/mineiros-io/terraform-google-billing-budget/pulls
[contribution guidelines]: https://github.com/mineiros-io/terraform-google-billing-budget/blob/main/CONTRIBUTING.md
