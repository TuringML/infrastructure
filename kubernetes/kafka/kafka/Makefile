.PHONY: create-kafka
create-kafka:	
	kubectl create -f ${ENV_WORK_DIR}deployment/service.yaml --namespace kafka
	kubectl create -f ${ENV_WORK_DIR}deployment/service-headless.yaml --namespace kafka
	kubectl create -f ${ENV_WORK_DIR}deployment/statefulset.yaml --namespace kafka

.PHONY: delete-kafka
delete-kafka:
	kubectl delete -f ${ENV_WORK_DIR}deployment/service.yaml --namespace kafka
	kubectl delete -f ${ENV_WORK_DIR}deployment/service-headless.yaml --namespace kafka
	kubectl delete -f ${ENV_WORK_DIR}deployment/statefulset.yaml --namespace kafka