#? https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform
terraform {
  source = "git@github.com:sportingsolutions/SS.Terraform.INFRA.AWS.Modules.git//organizations_account"
}
include {
  path = find_in_parent_folders("root.hcl")
}
