terraform {
  source = "git@github.com:sportingsolutions/SS.Terraform.INFRA.AWS.Modules.git//organizations_units_accounts"
}
include {
  path = find_in_parent_folders("root.hcl")
}
