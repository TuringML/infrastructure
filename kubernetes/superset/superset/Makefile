.PHONY: create-superset
create-superset:
	kubectl create -f ${ENV_WORK_DIR}deployment/secrets.yaml --namespace superset
	kubectl create -f ${ENV_WORK_DIR}deployment/deployment.yaml --namespace superset
	kubectl create -f ${ENV_WORK_DIR}deployment/service.yaml --namespace superset

.PHONY: delete-superset
delete-superset:
	kubectl delete -f ${ENV_WORK_DIR}deployment/secrets.yaml --namespace superset
	kubectl delete -f ${ENV_WORK_DIR}deployment/deployment.yaml --namespace superset
	kubectl delete -f ${ENV_WORK_DIR}deployment/service.yaml --namespace superset