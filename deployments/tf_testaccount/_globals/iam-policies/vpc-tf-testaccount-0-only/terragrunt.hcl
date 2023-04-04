dependency "vpc" {
  config_path = "../../../eu-west-2/vpc-tf-testaccount-0"
}
inputs = {
  name        = "spin_${dependency.vpc.outputs.name}_policy"
  path        = "/"
  description = "Policy to allow access only to VPC:  ${dependency.vpc.outputs.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:Vpc": "${dependency.vpc.outputs.vpc_id}"
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF


}

terraform {
  source = "tfr://registry.terraform.io/terraform-aws-modules/iam/aws//modules/iam-policy?version=5.16.0"
}
include {
  path = find_in_parent_folders("root.hcl")
}
