# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  account_name   = "learn-aft"
  aws_account_id = "610770342844" # TODO: replace me with your AWS account ID!
  aws_profile    = "non-prod"
  aws_arn        = "arn:aws:sts::288826279134:assumed-role/AzureAD-AWS-Admins/fsemti@sportinggroup.co.uk"
}

/*
-----------------------------------------------
|                ListAccounts                 |
+----------------------------+----------------+
|  Audit                     |  862694514466  |
|  Log Archive               |  870598241413  |
|  spin-mis-dev              |  743701138964  |
|  sandierbox-aft            |  488123108087  |
|  learn-aft                 |  610770342844  |
|  spin-mis-prod             |  616474816623  |
|  tf_testaccount-anotherone |  966228174658  |
|  Network                   |  343167160641  |
|  sandbox-aft               |  005943908701  |
|  cristian-testing          |  616635090700  |
|  spin-mis-uat              |  611631680728  |
|  spinfo-abp-testing        |  442707603723  |
|  tf_testaccount            |  410852369909  |
|  Telemetry                 |  153221040077  |
|  CloudConnect              |  092319565926  |
|  FingleFactor              |  838381427076  |
|  spin-fdj-proto            |  961914026780  |
|  tf_testaccount-another    |  872086963302  |
|  Spin AWS                  |  288826279134  |
+----------------------------+----------------+
*/
