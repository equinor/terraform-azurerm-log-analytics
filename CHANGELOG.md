# Changelog

## [2.4.3](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.4.2...v2.4.3) (2025-07-03)


### Bug Fixes

* argument `local_authentication_disabled` has been deprecated ([#68](https://github.com/equinor/terraform-azurerm-log-analytics/issues/68)) ([cbd6869](https://github.com/equinor/terraform-azurerm-log-analytics/commit/cbd6869ed8c38af79bf17c026c939d690f79dc83))

## [2.4.2](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.4.1...v2.4.2) (2025-06-17)


### Bug Fixes

* argument metric for resource azurerm_monitor_diagnostic_setting has been deprecated ([#66](https://github.com/equinor/terraform-azurerm-log-analytics/issues/66)) ([b4829e6](https://github.com/equinor/terraform-azurerm-log-analytics/commit/b4829e69914cb86d27e12984d1279fbbcf966852))

## [2.4.1](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.4.0...v2.4.1) (2025-04-24)


### Documentation

* update README ([2bf8876](https://github.com/equinor/terraform-azurerm-log-analytics/commit/2bf8876d55eef65769b757afd3e7c8a5477a4802))

## [2.4.0](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.3.0...v2.4.0) (2025-03-14)


### Features

* send diagnostic to separate workspace ([#62](https://github.com/equinor/terraform-azurerm-log-analytics/issues/62)) ([57074ed](https://github.com/equinor/terraform-azurerm-log-analytics/commit/57074edbb78f526b10beb76f5d33267acb7acde2))

## [2.3.0](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.2.3...v2.3.0) (2024-09-30)


### Features

* prevent accidental destroy of workspace ([#59](https://github.com/equinor/terraform-azurerm-log-analytics/issues/59)) ([fb2013b](https://github.com/equinor/terraform-azurerm-log-analytics/commit/fb2013b104d271e14ce60c859f077c706806c42a))


### Bug Fixes

* correct minimum required Azure provider version ([#60](https://github.com/equinor/terraform-azurerm-log-analytics/issues/60)) ([69dbca6](https://github.com/equinor/terraform-azurerm-log-analytics/commit/69dbca6fa70b38211e3f9dc6c4138770f0a8d8bf))

## [2.2.3](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.2.2...v2.2.3) (2024-09-06)


### Documentation

* add default data retention to features list in README ([#57](https://github.com/equinor/terraform-azurerm-log-analytics/issues/57)) ([549a99a](https://github.com/equinor/terraform-azurerm-log-analytics/commit/549a99a13ea692529cd6517bfec9ba14037e656f))

## [2.2.2](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.2.1...v2.2.2) (2024-08-27)


### Documentation

* add features list to README ([#55](https://github.com/equinor/terraform-azurerm-log-analytics/issues/55)) ([e77a9d2](https://github.com/equinor/terraform-azurerm-log-analytics/commit/e77a9d2d58db33b3a421388f1f12dd5b66e100d4))

## [2.2.1](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.2.0...v2.2.1) (2024-08-19)


### Documentation

* update variable descriptions ([90ff7dd](https://github.com/equinor/terraform-azurerm-log-analytics/commit/90ff7ddfdc16e77421fb9ccb7225a6d0e63ecd12))

## [2.2.0](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.1.2...v2.2.0) (2024-02-26)


### Features

* variable for diagnostic settng metric ([#44](https://github.com/equinor/terraform-azurerm-log-analytics/issues/44)) ([db51c3d](https://github.com/equinor/terraform-azurerm-log-analytics/commit/db51c3d8edd45f983d693143f1371f94e775dd86))

## [2.1.2](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.1.1...v2.1.2) (2023-12-20)


### Bug Fixes

* remove diagnostic setting retention policies ([#39](https://github.com/equinor/terraform-azurerm-log-analytics/issues/39)) ([17efee1](https://github.com/equinor/terraform-azurerm-log-analytics/commit/17efee155843612c947b281862ca110895e2f9a8))

## [2.1.1](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.1.0...v2.1.1) (2023-09-19)


### Reverts

* don't send activity logs to Log Analytics ([#32](https://github.com/equinor/terraform-azurerm-log-analytics/issues/32)) ([a7618da](https://github.com/equinor/terraform-azurerm-log-analytics/commit/a7618da267e59d53c7569177ace20a004bc255aa))

## [2.1.0](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v2.0.0...v2.1.0) (2023-09-07)


### Features

* send activity logs to Log Analytics ([#30](https://github.com/equinor/terraform-azurerm-log-analytics/issues/30)) ([d68f1de](https://github.com/equinor/terraform-azurerm-log-analytics/commit/d68f1de8f10337bac77cfb762a3fe8342690a175))

## [2.0.0](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v1.5.0...v2.0.0) (2023-07-26)


### ⚠ BREAKING CHANGES

* disable local authentication by default ([#26](https://github.com/equinor/terraform-azurerm-log-analytics/issues/26))

### Features

* disable local authentication by default ([#26](https://github.com/equinor/terraform-azurerm-log-analytics/issues/26)) ([2cb87b4](https://github.com/equinor/terraform-azurerm-log-analytics/commit/2cb87b49a04044ed3faefef487c9862e094ee382))


### Bug Fixes

* don't specify Log Analytics destination type ([#28](https://github.com/equinor/terraform-azurerm-log-analytics/issues/28)) ([2488bec](https://github.com/equinor/terraform-azurerm-log-analytics/commit/2488becb33e484e064fc23c4603c3d4484a86f46))

## [1.5.0](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v1.4.0...v1.5.0) (2023-04-19)


### Features

* set diagnostic setting enabled log categories ([#23](https://github.com/equinor/terraform-azurerm-log-analytics/issues/23)) ([7083869](https://github.com/equinor/terraform-azurerm-log-analytics/commit/708386906c92200291191a5f7d63fec370776940))

## [1.4.0](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v1.3.1...v1.4.0) (2023-03-30)


### Features

* output customer ID and shared key ([#19](https://github.com/equinor/terraform-azurerm-log-analytics/issues/19)) ([bf0a17c](https://github.com/equinor/terraform-azurerm-log-analytics/commit/bf0a17cf1593798382cf187640295d826e10a2fb))

## [1.3.1](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v1.3.0...v1.3.1) (2023-02-08)


### Bug Fixes

* set log analytics destination type to null by default ([#16](https://github.com/equinor/terraform-azurerm-log-analytics/issues/16)) ([1bae0ea](https://github.com/equinor/terraform-azurerm-log-analytics/commit/1bae0eabbb9ea0cf7d7c580713c3d692d5cb7222))

## [1.3.0](https://github.com/equinor/terraform-azurerm-log-analytics/compare/v1.2.0...v1.3.0) (2023-02-07)


### Features

* set log analytics destination type and update min. provider version ([#13](https://github.com/equinor/terraform-azurerm-log-analytics/issues/13)) ([61caf6c](https://github.com/equinor/terraform-azurerm-log-analytics/commit/61caf6c605e8a0d8e1087908953d595b248fe786))
