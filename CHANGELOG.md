# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [v1.3.0] - 2023-02-24
* moved `vm` module to <https://github.com/sportingsolutions/SS.Terraform.VMWare.Modules> - this is no longer a mono-repo deployment
* the `vm` module in turn executes the `scrpipt_loader` module (will need to review the logic, to allow this one to be executed on demand; currently it is not optional)
* minor convenience improvements on the makefile
* added `TODO.md`

## [v1.2.1] - 2023-02-24

* I have separated the modules (particularly the `scrpipt_loader`, which is designated to run some sample scripts upon the deployment) to a separate repository.

## [v1.2.0] - 2023-02-24

* Added option to deploy VM
* Currently the custom vm module is limted to deploy clustered vm-s (To be review: if non-clustered switching - and Linux - neccesary? (currently very little is deployed in the non-clustered data centers, to validate complexity))

## [v1.1.0] - 2020-12-06

Companion blog post:

https://thirstydeveloper.io/tf-skeleton/2021/01/23/part-2-variables.html

### Added

* Loading variable values from config.yml files

## [v1.0.0] - 2020-11-24

Companion blog post:

https://thirstydeveloper.io/2021/01/17/part-1-organizing-terragrunt.html

### Added

* .gitignore from [gitignore.io](https://www.toptal.com/developers/gitignore/api/terraform,terragrunt)
* Set [tfenv](https://github.com/tfutils/tfenv) .terraform-version to 0.13.5
* Set [tgenv](https://github.com/cunymatthieu/tgenv) .terragrunt-version to 0.26.4
* Add initial [pre-commit](https://pre-commit.com/) hooks
* Initial skeleton deployments
