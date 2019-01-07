.PHONY: create-nifi
create-nifi:
	kubectl create ns nifi
	kubectl create -f ${ENV_WORK_DIR}deployment/ingress.yaml --namespace=nifi
	kubectl create -f ${ENV_WORK_DIR}deployment/service.yaml --namespace=nifi
	kubectl create -f ${ENV_WORK_DIR}deployment/statefulset.yaml --namespace=nifi

.PHONY: delete-nifi
delete-nifi:
	kubectl delete -f ${ENV_WORK_DIR}deployment/ingress.yaml --namespace=nifi
	kubectl delete -f ${ENV_WORK_DIR}deployment/service.yaml --namespace=nifi
	kubectl delete -f ${ENV_WORK_DIR}deployment/statefulset.yaml --namespace=nifi
	kubectl delete ns nifi

.PHONY: expose-nifi
expose:
	kubectl expose service nifi -n nifi --type=LoadBalancer --port=8080 --target-port=8080 --name=nifi-http
