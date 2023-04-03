#

# sample run

```hcl
 > terragrunt apply

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.iam_user["jbloggs"].aws_iam_access_key.this[0] will be created
  + resource "aws_iam_access_key" "this" {
      + create_date                    = (known after apply)
      + encrypted_secret               = (known after apply)
      + encrypted_ses_smtp_password_v4 = (known after apply)
      + id                             = (known after apply)
      + key_fingerprint                = (known after apply)
      + pgp_key                        = "keybase:fsemti808"
      + secret                         = (sensitive value)
      + ses_smtp_password_v4           = (sensitive value)
      + status                         = "Active"
      + user                           = "jbloggs"
    }

  # module.iam_user["jbloggs"].aws_iam_user.this[0] will be created
  + resource "aws_iam_user" "this" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "jbloggs"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # module.iam_user["jbloggs"].aws_iam_user_login_profile.this[0] will be created
  + resource "aws_iam_user_login_profile" "this" {
      + encrypted_password      = (known after apply)
      + id                      = (known after apply)
      + key_fingerprint         = (known after apply)
      + password                = (known after apply)
      + password_length         = 20
      + password_reset_required = true
      + pgp_key                 = "keybase:fsemti808"
      + user                    = "jbloggs"
    }

  # module.iam_user["jdoe"].aws_iam_access_key.this[0] will be created
  + resource "aws_iam_access_key" "this" {
      + create_date                    = (known after apply)
      + encrypted_secret               = (known after apply)
      + encrypted_ses_smtp_password_v4 = (known after apply)
      + id                             = (known after apply)
      + key_fingerprint                = (known after apply)
      + pgp_key                        = "keybase:fsemti808"
      + secret                         = (sensitive value)
      + ses_smtp_password_v4           = (sensitive value)
      + status                         = "Active"
      + user                           = "jdoe"
    }

  # module.iam_user["jdoe"].aws_iam_user.this[0] will be created
  + resource "aws_iam_user" "this" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "jdoe"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # module.iam_user["jdoe"].aws_iam_user_login_profile.this[0] will be created
  + resource "aws_iam_user_login_profile" "this" {
      + encrypted_password      = (known after apply)
      + id                      = (known after apply)
      + key_fingerprint         = (known after apply)
      + password                = (known after apply)
      + password_length         = 20
      + password_reset_required = true
      + pgp_key                 = "keybase:fsemti808"
      + user                    = "jdoe"
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + iam_user_summary = [
      + (known after apply),
      + (known after apply),
    ]

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.iam_user["jbloggs"].aws_iam_user.this[0]: Creating...
module.iam_user["jdoe"].aws_iam_user.this[0]: Creating...
module.iam_user["jbloggs"].aws_iam_user.this[0]: Creation complete after 1s [id=jbloggs]
module.iam_user["jbloggs"].aws_iam_access_key.this[0]: Creating...
module.iam_user["jbloggs"].aws_iam_user_login_profile.this[0]: Creating...
module.iam_user["jdoe"].aws_iam_user.this[0]: Creation complete after 1s [id=jdoe]
module.iam_user["jdoe"].aws_iam_access_key.this[0]: Creating...
module.iam_user["jdoe"].aws_iam_user_login_profile.this[0]: Creating...
module.iam_user["jbloggs"].aws_iam_user_login_profile.this[0]: Creation complete after 1s [id=jbloggs]
module.iam_user["jdoe"].aws_iam_access_key.this[0]: Creation complete after 1s [id=AKIAV7KFVUX2QFKMKT4T]
module.iam_user["jbloggs"].aws_iam_access_key.this[0]: Creation complete after 1s [id=AKIAV7KFVUX2X5BCWAKE]
module.iam_user["jdoe"].aws_iam_user_login_profile.this[0]: Creation complete after 1s [id=jdoe]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

iam_user_summary = tolist([
  <<-EOT
  To return password of user jbloggs run: echo "wcFMA99aMF0EMF9bARAAuZJJDJww4IRvcKUojZbiiXmPEfwvhKOSezVOYoEFaxp+Yjq6KbT8uybrqTxTZKzAyFFhma8tTqPd4Kuu3svZqfD69VDgRLWpi8nNfQ++RQx5/hwTmFwmc08mDS8pnRFO9olYiWgkMaQ8fyUSAm2wxW+9G3ZcTIMWKym17wBHuiaYFH9P8GhrrL8tV3VOGrN3/9AoRARWme4tIh+C9s4UDi2+s9MHLmQfI2+7CzZZWtD5obvCRldq5GDR92N6SM7dxIK26FR5tfQnn2rtB+xFdi9oQw4JKuC+Y9DgAnhBDQfOpwYefKo7E9ZGEC+7nPC+cldrqDzOjqa6WwCV5ml/dTHe+PGNMd0jsp7a/3S9ckJzCO704PTcpds7McWfwhpXsIJj39P3LD6i0Tnu+ivHmBYIhl9gby6xKaEpeTGDOyRho6+WuKue9KxExmRntMifFB/l1GCHoSIDQq1Ow8AO5aMB+wC+Plr0cS4uwe2Eg1XppCDxpdfrh/rELQB2vZ2xljLOd7MCuAPJi24tQak0jpXoXPAqYIvz3jkTRo5UYEzg3sv3vBo3efZjFuFtam4KCblCFvYGYprdFYJIRhPqdneTSp0yINlzw4JdUIiDA0n+BnEI2U7G2hnvKCF1gMNqI/BlJEfH+t0sQAevv12IBwtXdy9dNtI1duLFqDMsELLSRQGcaaHCaTg/LJ7ALe3QWW0ek+r9DGsnkCBG2/legMmarSEF/fFgpkT5NUZDZgzf8OvzCRjMqy/4xbkVXRW9cf/PyoypXQ==" | base64 --decode | keybase pgp decrypt

  EOT,
  <<-EOT
  To return password of user jdoe run: echo "wcFMA99aMF0EMF9bAQ/9GwxfVDdTxOaasVoT04JnHRe1CVSqlX/0Ob6bdJdsSVwfd/wC2FYPN3Axawjft8ZIWdcGlzUqewcvI3qX8qRGAdPv6fjJpmVPgx2FgZkHwX9qjgGZmhzM/EVqxZm+jxVFVYgkz+vrcduIdic2txU0G6oxgeGLaUcNe468S5HIILIDORsSrOPWOIrCBSu3MzYzL1j2GhTX9O6mnFf7JIbqX7YexXA+XPWeUWwpQgivLkAXoeygYNTD1JC9zmaTboMuZuQgKUvHbCRW2HmjHOVZly/WNmPIhgAnOELYLZSOzbSfC8xTfqsE/VHGBSgFFYXbyGjXInGuT6Zav/PLc0yFGYfWnp9nJg9xaJguFoqukLzferfUQq6ndOvIBXCkkbx1Ote5/QzZjASyjQ74tMlsO06k4JsLvP+qoUK8ez6GOrvjIrj//UbSJ5bfloRvJ6fg/q3tF36BgZCw65FmQVmsG3C4/+y08LtT8lX8kabiciWoN49i6dr+ybwg8rXKSUpDmbMtlldWhrF8wS2Nt+Ni6+3YpZpoA7mmoI3JdWG2AGwJ8SmlW8ntifiPKG8PrOzVeXOM8mIxu2n05AFsBBcm9BFtmJlA402Apce4MdSQqb48EaOSflW2vk8xN3rVyDb4Y2zgDBBfXkIUWeaww43J7iwiNWppSJMGLtoFAGVJlJTSRQEfIX5W8xONvUOC589/ty7jLlhPGeWSsEahpjGEEQA5TMHvv9t3dXmSZEzKWWAXCPRol8hlLenI2n6b2pd3GZ1OBepB+g==" | base64 --decode | keybase pgp decrypt

  EOT,
])
```

As you may noticed, this created two users, and necessary associations.

To create further accounts, supply further user accounts - allong the neccesary settings - to the `config.yml` file:


```sh
 cat /home/fabrice/projects/terraform/SS.Terraform.INFRA.AWS/deployments/tf_testaccount/_globals/iam-users/config.yml
---

iam_users:
  jbloggs:
    force_destroy: false
    pgp_key: "keybase:fsemti808"
    password_reset_required: false
  jdoe:
    force_destroy: false
    pgp_key: "keybase:fsemti808"
    password_reset_required: false
```

(At this point you can observer the users in the account's s3 console or via cli)

## Retrieve user initial password

To retrieve the user's password, you would need to do a bit of a prparation.

- register yourself at `https://keybase.io/`

- install and set up [keybase cli matching to your OS](https://keybase.io/download) - or use the web gui (albeit you will need your `pgp` key to do so, so cli is probably more convenient)

- once this has been done, notice the return of the `terragrunt` from above:


```sh
  To return password of user jbloggs run: echo "wcFMA99aMF0EMF9bARAAuZJJDJww4IRvcKUojZbiiXmPEfwvhKOSezVOYoEFaxp+Yjq6KbT8uybrqTxTZKzAyFFhma8tTqPd4Kuu3svZqfD69VDgRLWpi8nNfQ++RQx5/hwTmFwmc08mDS8pnRFO9olYiWgkMaQ8fyUSAm2wxW+9G3ZcTIMWKym17wBHuiaYFH9P8GhrrL8tV3VOGrN3/9AoRARWme4tIh+C9s4UDi2+s9MHLmQfI2+7CzZZWtD5obvCRldq5GDR92N6SM7dxIK26FR5tfQnn2rtB+xFdi9oQw4JKuC+Y9DgAnhBDQfOpwYefKo7E9ZGEC+7nPC+cldrqDzOjqa6WwCV5ml/dTHe+PGNMd0jsp7a/3S9ckJzCO704PTcpds7McWfwhpXsIJj39P3LD6i0Tnu+ivHmBYIhl9gby6xKaEpeTGDOyRho6+WuKue9KxExmRntMifFB/l1GCHoSIDQq1Ow8AO5aMB+wC+Plr0cS4uwe2Eg1XppCDxpdfrh/rELQB2vZ2xljLOd7MCuAPJi24tQak0jpXoXPAqYIvz3jkTRo5UYEzg3sv3vBo3efZjFuFtam4KCblCFvYGYprdFYJIRhPqdneTSp0yINlzw4JdUIiDA0n+BnEI2U7G2hnvKCF1gMNqI/BlJEfH+t0sQAevv12IBwtXdy9dNtI1duLFqDMsELLSRQGcaaHCaTg/LJ7ALe3QWW0ek+r9DGsnkCBG2/legMmarSEF/fFgpkT5NUZDZgzf8OvzCRjMqy/4xbkVXRW9cf/PyoypXQ==" | base64 --decode | keybase pgp decrypt
  ```

  this is the actual command that you would need to run. In this example I used my account, so that is the only one that can retrieve this. (These are test accounts, so I am showing here the actual process)

  ```sh
   echo "wcFMA99aMF0EMF9bARAAuZJJDJww4IRvcKUojZbiiXmPEfwvhKOSezVOYoEFaxp+Yjq6KbT8uybrqTxTZKzAyFFhma8tTqPd4Kuu3svZqfD69VDgRLWpi8nNfQ++RQx5/hwTmFwmc08mDS8pnRFO9olYiWgkMaQ8fyUSAm2wxW+9G3ZcTIMWKym17wBHuiaYFH9P8GhrrL8tV3VOGrN3/9AoRARWme4tIh+C9s4UDi2+s9MHLmQfI2+7CzZZWtD5obvCRldq5GDR92N6SM7dxIK26FR5tfQnn2rtB+xFdi9oQw4JKuC+Y9DgAnhBDQfOpwYefKo7E9ZGEC+7nPC+cldrqDzOjqa6WwCV5ml/dTHe+PGNMd0jsp7a/3S9ckJzCO704PTcpds7McWfwhpXsIJj39P3LD6i0Tnu+ivHmBYIhl9gby6xKaEpeTGDOyRho6+WuKue9KxExmRntMifFB/l1GCHoSIDQq1Ow8AO5aMB+wC+Plr0cS4uwe2Eg1XppCDxpdfrh/rELQB2vZ2xljLOd7MCuAPJi24tQak0jpXoXPAqYIvz3jkTRo5UYEzg3sv3vBo3efZjFuFtam4KCblCFvYGYprdFYJIRhPqdneTSp0yINlzw4JdUIiDA0n+BnEI2U7G2hnvKCF1gMNqI/BlJEfH+t0sQAevv12IBwtXdy9dNtI1duLFqDMsELLSRQGcaaHCaTg/LJ7ALe3QWW0ek+r9DGsnkCBG2/legMmarSEF/fFgpkT5NUZDZgzf8OvzCRjMqy/4xbkVXRW9cf/PyoypXQ==" | base64 --decode | keybase pgp decrypt
<< actual password >>
```

So at this point the user can log in via the
