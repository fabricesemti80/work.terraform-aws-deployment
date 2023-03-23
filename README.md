# terraform-terragrunt-skeleton [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

This repository implements a skeleton repository for teams to use when first getting started with [terraform](https://www.terraform.io/). It uses [terragrunt](https://terragrunt.gruntwork.io/) as a workflow tool.

For a step-by-step guide for how this repo was built, the why behind it, and
how to use it, see this blog series:

https://thirstydeveloper.io/series/tf-skeleton

## Prerequisites

This project uses:

* [tfenv](https://github.com/tfutils/tfenv) for managing terraform versions
* [tgenv](https://github.com/cunymatthieu/tgenv) for managing terragrunt versions
* [pre-commit](https://pre-commit.com/) for running syntax, semantic, and style checks on `git commit`

After installing those tools run `tfenv install` and `tgenv install` from the
clone of this repository to install the configured versions of terraform and
terragrunt. Then, run `pre-commit install` to install the pre-commit hooks.

You will also need to install and configure / login to [aws-azure-login](https://sportingsolutions.atlassian.net/wiki/spaces/IO/pages/1014202508/AWS+CLI+Access+with+Azure+federated+login+on+AWS), as our AWS is using SAML2

## Usage

Run `terragrunt` commands from directories under `deployments/` containing
`terragrunt.hcl` files.

terragrunt `*-all` commands can be run from the repository root, or the
`deployments/` and any directory underneath it. For instance:

* Run `terragrunt plan-all` from the repository root to generate terraform
  plans for all deployments.
* Run `terragrunt plan-all` from `deployments/app/dev` to generate plans for
  all `app/dev` deployments.

For additional guidance, see the companion blog series:

https://thirstydeveloper.io/series/tf-skeleton

## Sample full usage

```sh

$ tfenv --version
tfenv 3.0.0

$ tgenv --version
tgenv 0.1.0

$ git clone git@github.com:sportingsolutions/SS.Terraform.INFRA.AWS.git
Cloning into 'SS.Terraform.INFRA.AWS'...
remote: Enumerating objects: 40, done.
remote: Counting objects: 100% (40/40), done.
remote: Compressing objects: 100% (30/30), done.
remote: Total 40 (delta 2), reused 40 (delta 2), pack-reused 0
Receiving objects: 100% (40/40), 7.75 KiB | 7.75 MiB/s, done.
Resolving deltas: 100% (2/2), done.

$ cd SS.Terraform.INFRA.AWS

$ cat .terraform-version
1.3.9

$ cat .terragrunt-version
0.43.2

$ tfenv install
Terraform v1.3.9 is already installed

$ tgenv install
Terragrunt v0.43.2 is already installed

$ pre-commit --version
pre-commit 3.1.1

$ pre-commit install
pre-commit installed at .git/hooks/pre-commit

$ aws-azure-login
(node:26999) NOTE: We are formalizing our plans to enter AWS SDK for JavaScript (v2) into maintenance mode in 2023.

Please migrate your code to use AWS SDK for JavaScript (v3).
For more information, check the migration guide at https://a.co/7PzMCcy
Logging in with profile 'default'...
Using AWS SAML endpoint https://signin.aws.amazon.com/saml
Assuming role arn:aws:iam::288826279134:role/AzureAD-AWS-Admins

$ terragrunt run-all plan
INFO[0000] The stack at /home/fabrice/projects/terraform/SS.Terraform.INFRA.AWS will be processed in the following order for command plan:
Group 1
- Module /home/fabrice/projects/terraform/SS.Terraform.INFRA.AWS/deployments/oy/prod/test-stack
- Module /home/fabrice/projects/terraform/SS.Terraform.INFRA.AWS/deployments/oy/stage/test-stack

WARN[0000] No double-slash (//) found in source URL /home/fabrice/projects/terraform/SS.Terraform.INFRA.AWS/deployments/../modules/stacks/oy/test-stack. Relative paths in downloaded Terraform code may not work.  prefix=[/home/fabrice/projects/terraform/SS.Terraform.INFRA.AWS/deployments/oy/prod/test-stack]
WARN[0000] No double-slash (//) found in source URL /home/fabrice/projects/terraform/SS.Terraform.INFRA.AWS/deployments/../modules/stacks/oy/test-stack. Relative paths in downloaded Terraform code may not work.  prefix=[/home/fabrice/projects/terraform/SS.Terraform.INFRA.AWS/deployments/oy/stage/test-stack]

Initializing the backend...

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Reusing previous version of hashicorp/random from the dependency lock file

Initializing provider plugins...
- Reusing previous version of hashicorp/random from the dependency lock file
- Installing hashicorp/random v3.0.1...
- Installing hashicorp/random v3.0.1...
- Installed hashicorp/random v3.0.1 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
- Installed hashicorp/random v3.0.1 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_pet.pet will be created
  + resource "random_pet" "pet" {
      + id        = (known after apply)
      + length    = 2
      + separator = "-"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + env_var    = "set in deployments/app/prod"
  + global_var = "overridden in deployments/app"
  + layer_var  = "unset"
  + pet        = (known after apply)
  + stack_var  = "set in deployments/app/prod/test-stack/"
  + tier_var   = "set in deployments/app/"

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_pet.pet will be created
  + resource "random_pet" "pet" {
      + id        = (known after apply)
      + length    = 2
      + separator = "-"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + env_var    = "set in deployments/app/stage"
  + global_var = "overridden in deployments/app"
  + layer_var  = "unset"
  + pet        = (known after apply)
  + stack_var  = "set in deployments/app/stage/test-stack/"
  + tier_var   = "set in deployments/app/"

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
INFO[0003]
Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Reusing previous version of hashicorp/random from the dependency lock file
- Installing hashicorp/random v3.0.1...
- Installed hashicorp/random v3.0.1 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
INFO[0003]
Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Reusing previous version of hashicorp/random from the dependency lock file
- Installing hashicorp/random v3.0.1...
- Installed hashicorp/random v3.0.1 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

```
