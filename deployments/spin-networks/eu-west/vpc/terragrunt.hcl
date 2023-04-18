#? https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform
terraform {
  source = "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=4.0.1"
}
include {
  path = find_in_parent_folders("root.hcl")
}
