#? https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform
terraform {
  source = "git@github.com:sportingsolutions/SS.Terraform.INFRA.AWS.Modules.git//vpcs"
}
include {
  path = find_in_parent_folders("root.hcl")
}
