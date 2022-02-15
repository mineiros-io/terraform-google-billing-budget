# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.3]

### Changed

- Upgrade minimum supported provider version to `v4.6` since it includes a fix
  for a critical bugs that didn't allow to update labels after the initial creation.
  For details please see https://github.com/hashicorp/terraform-provider-google/blob/master/CHANGELOG.md#460-january-10-2021

## [0.0.2]

### Added

- Implement support for the `last_period_amount` argument.

### Changed

- Make the `amount` variable optional.

## [0.0.1]

### Added

- Implement support for the `google_billing_budget` resource

[unreleased]: https://github.com/mineiros-io/terraform-google-billing-budget/compare/v0.0.3...HEAD
[0.0.3]: https://github.com/mineiros-io/terraform-google-billing-budget/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/mineiros-io/terraform-google-billing-budget/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/mineiros-io/terraform-google-billing-budget/releases/tag/v0.0.1
