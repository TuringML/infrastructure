.PHONY: create-flink
create-flink:
	kubectl create ns flink
	kubectl create -f ${ENV_WORK_DIR}deployment/jobmanager-deployment.yaml --namespace flink
	kubectl create -f ${ENV_WORK_DIR}deployment/jobmanager-service.yaml --namespace flink
	kubectl create -f ${ENV_WORK_DIR}deployment/taskmanager-deployment.yaml --namespace flink

.PHONY: delete-flink
delete-flink:
	kubectl delete -f ${ENV_WORK_DIR}deployment/jobmanager-deployment.yaml --namespace flink
	kubectl delete -f ${ENV_WORK_DIR}deployment/jobmanager-service.yaml --namespace flink
	kubectl delete -f ${ENV_WORK_DIR}deployment/taskmanager-deployment.yaml --namespace flink
	kubectl delete ns flink