# terraform-terragrunt-skeleton [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

This repository implements a skeleton repository for teams to use when first getting started with [terraform](https://www.terraform.io/). It uses [terragrunt](https://terragrunt.gruntwork.io/) as a workflow tool.

For a step-by-step guide for how this repo was built, the why behind it, and
how to use it, see this blog series:

https://thirstydeveloper.io/series/tf-skeleton

## Prerequisites

Mandatory tools:

- [Terragrunt](https://terragrunt.gruntwork.io/) - _before installing please see optional tools!_
- [Terraform](https://www.terraform.io/) - _before installing please see optional tools!_
- [AWS Azure Login](https://www.npmjs.com/package/aws-azure-login)
  - *see [guide](https://sportingsolutions.atlassian.net/wiki/spaces/IO/pages/1014202508/AWS+CLI+Access+with+Azure+federated+login+on+AWS) also*
  - as it is an npm package, it requires [nodejs](https://nodejs.org/en/download) - _before installing please see optional tools!_

Optional tools:

  Generally I like to install most `node` / `terraform` / and `terragrunt` with the "** version managers"; as these allow having different versions installed.
  I also like to use Homebrew for installations on `Linux` systems (use `brew`  on Mac for similar results)

### Setup (for Unix systems):

  1. Install Homebrew (if Linux) - <https://brew.sh/> - follow ***all*** instructions, and make sure it loads to your shell

  2. Install packages with Homebrew `brew install tfenv tgenv nvm` / or install them as per their respective websites

  * [tfenv](https://github.com/tfutils/tfenv) for managing terraform versions
  * [tgenv](https://github.com/cunymatthieu/tgenv) for managing terragrunt versions
  * [nvm](https://github.com/nvm-sh/nvm) for managing `NodeJS` / `NPM` versions

  3. After installing those tools run `tfenv install` and `tgenv install` from the clone of this repository to install the configured versions of Terraform and Terragrunt.

  4. We also need `NodeJS`, installed with [nvm](https://heynode.com/tutorial/install-nodejs-locally-nvm/)

  5. Once we have `Node`, we can then install `aws-azure-login` with `npm` (which is bundled with `NodeJS`)

  6. Finally a few optional packages I am recommending - ideally with `brew install pre-commit awscli terraform-docs direnv` :

  * [direnv](https://direnv.net/) - to load secrets as env vars
  * [pre-commit](https://pre-commit.com/) - for running syntax, semantic, and style checks on `git commit`
  * [terraform-docs](https://terraform-docs.io/) - needed for `pre-commit`
  * [awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) - worths having it since you are working with AWS, need to check resources from time to time

### Setup (for Windows systems):

You may be use some of the tools listed, and you can achieve some level of workability, but I really suggest *not* using Windows for this project. But the bare minimum you will need on Win:

1. [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) - this is default present on Linux, on Win - not so much

2. `Terraform`

3. `Terragrunt`

4. `Node` -> for `aws-azure-login`

The rest of the tools I do not think you can find in Win. But you are welcome to try; I would also recommend to try to use `chocolatey` to install these, as much as you can.

## Usage

Run `terragrunt` commands from directories under `deployments/` containing
`terragrunt.hcl` files.

terragrunt `*-all` commands can be run from the repository root, or the
`deployments/` and any directory underneath it. For instance:

* Run `terragrunt plan-all` from the repository root to generate terraform
  plans for all deployments.
* Run `terragrunt plan-all` from `deployments/app/dev` to generate plans for
  all `app/dev` deployments.

## Closing notes

For additional guidance / source material, see the companion blog series:

https://thirstydeveloper.io/series/tf-skeleton
