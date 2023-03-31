#? https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform
terraform {
  source = "tfr://registry.terraform.io/terraform-aws-modules/iam/aws//modules/iam-policy?version=5.16.0"
}
include {
  path = find_in_parent_folders("root.hcl")
}
