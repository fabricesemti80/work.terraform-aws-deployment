#& default rules
.PHONY: default
default: plan-all

.PHONY: clean
clean:
	find . -type d -name '.terragrunt-cache' -exec rm -rf {} +

#& VMs only
.PHONY: plan-vm-prod
plan-vm-prod:
	cd deployments/app/prod/vm && terragrunt plan

.PHONY: apply-vm-prod
apply-vm-prod:
	cd deployments/app/prod/vm && terragrunt apply --auto-approve

.PHONY: apply-vm-prod
destroy-vm-prod:
	cd deployments/app/prod/vm && terragrunt destroy --auto-approve

#& run all
.PHONY: plan-all
plan-all:
	echo "Y" | terragrunt run-all plan

.PHONY: apply-all
apply-all:
	echo "Y" | terragrunt run-all apply --auto-approve


#& release management
