terraform {
  source = "git@github.com:sportingsolutions/SS.Terraform.INFRA.AWS.Modules.git//control_tower_aft"
}
include {
  path = find_in_parent_folders("root.hcl")
}
