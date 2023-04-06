#& default rules
.PHONY: default
default: plan-all

.PHONY: clean
clean:
	find . -type d -name '.terragrunt-cache' -exec rm -rf {} +

#& run all
.PHONY: plan-all
plan-all:
	echo "Y" | terragrunt run-all plan

.PHONY: apply-all
apply-all:
	echo "Y" | terragrunt run-all apply --auto-approve

.PHONY: destroy-all
destroy-all:
	terragrunt run-all destroy
