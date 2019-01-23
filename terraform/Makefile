.PHONY: create-workspace
create-workspace:
	terraform workspace new ${CLIENT_ID}

.PHONY: plan
plan: check-client-id
	terraform plan

.PHONY: apply
apply: check-client-id
	terraform apply -auto-approve

.PHONY: destroy
destroy: check-client-id
	terraform destroy -auto-approve

check-client-id:
ifndef CLIENT_ID
	$(error CLIENT_ID is not set)
endif
