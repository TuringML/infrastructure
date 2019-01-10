.PHONY: create-zookeeper
create-zookeeper:	
	kubectl create -f ${ENV_WORK_DIR}deployment/service.yaml --namespace kafka
	kubectl create -f ${ENV_WORK_DIR}deployment/service-headless.yaml --namespace kafka
	kubectl create -f ${ENV_WORK_DIR}deployment/statefulset.yaml --namespace kafka

.PHONY: delete-zookeeper
delete-zookeeper:
	kubectl delete -f ${ENV_WORK_DIR}deployment/service.yaml --namespace kafka
	kubectl delete -f ${ENV_WORK_DIR}deployment/service-headless.yaml --namespace kafka
	kubectl delete -f ${ENV_WORK_DIR}deployment/statefulset.yaml --namespace kafka
	