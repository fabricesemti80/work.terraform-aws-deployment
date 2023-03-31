locals {

  # Automatically load account-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Extract the variables we need for easy access
  account_name = local.account_vars.locals.account_name
  account_id   = local.account_vars.locals.aws_account_id
  aws_arn      = local.account_vars.locals.aws_arn

  aws_region = local.region_vars.locals.aws_region



  root_deployments_dir       = get_parent_terragrunt_dir()
  relative_deployment_path   = path_relative_to_include()
  deployment_path_components = compact(split("/", local.relative_deployment_path))

  tier  = local.deployment_path_components[0]
  stack = reverse(local.deployment_path_components)[0]

  # Get a list of every path between root_deployments_directory and the path of
  # the deployment
  possible_config_dirs = [
    for i in range(0, length(local.deployment_path_components) + 1) :
    join("/", concat(
      [local.root_deployments_dir],
      slice(local.deployment_path_components, 0, i)
    ))
  ]

  # Generate a list of possible config files at every possible_config_dir
  # (support both .yml and .yaml)
  possible_config_paths = flatten([
    for dir in local.possible_config_dirs : [
      "${dir}/config.yml",
      "${dir}/config.yaml"
    ]
  ])

  # Load every YAML config file that exists into an HCL map
  file_configs = [
    for path in local.possible_config_paths :
    yamldecode(file(path)) if fileexists(path)
  ]

  # Merge the maps together, with deeper configs overriding higher configs
  merged_config = merge(local.file_configs...)
}

# Pass the merged config to terraform as variable values using TF_VAR_
# environment variables
inputs = local.merged_config

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket  = "terraform-spin-aws-infra-state"
    region  = "eu-west-2"
    encrypt = true

    key = "${dirname(local.relative_deployment_path)}/${local.stack}.tfstate"

    dynamodb_table            = "terraform-spin-aws-infra-state-locks"
    accesslogging_bucket_name = "terraform-spin-aws-infra-state-logs"
  }
}


# Default the stack each deployment deploys based on its directory structure
# Can be overridden by redefining this block in a child terragrunt.hcl
terraform {
  source = "${local.root_deployments_dir}/../modules/stacks/${local.tier}/${local.stack}"
}


# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  # Only these AWS Account IDs may be operated on by this template
  allowed_account_ids = ["${local.account_id}"]
  assume_role {
    role_arn = "${local.aws_arn}"
  }
}
EOF
}
