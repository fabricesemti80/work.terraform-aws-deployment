# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  account_name   = "spin-networks"
  aws_account_id = "266786009940" # TODO: replace me with your AWS account ID!
  aws_profile    = "non-prod"
  aws_arn        = "arn:aws:iam::266786009940:role/AWSControlTowerExecution" # TODO: replace me with your AWS role ARN!
}



#? https://sportingsolutions.atlassian.net/wiki/spaces/IO/pages/3618832394/AWS+Role+Assumption+and+Trust#Adding-accounts%2Froles
#? aws iam list-roles | grep -B 10 -A 10 --color arn:aws:iam::288826279134:root #(do this under the relevant account!)
