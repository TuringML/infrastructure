
PHONY: all
all:
	kubectl create -f deployment/cr.yaml
	kubectl create -f deployment/rbac.yaml
	helm install --name heapster -f deployment/values.yaml stable/heapster

PHONY: destroy
destroy:
	helm delete heapster --purge
	kubectl delete -f deployment/cr.yaml
	kubectl delete -f deployment/rbac.yaml
