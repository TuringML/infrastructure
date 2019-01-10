.PHONY: create-postgres
create-postgres:	
	kubectl create -f ${ENV_WORK_DIR}deployment/secrets.yaml --namespace superset
	kubectl create -f ${ENV_WORK_DIR}deployment/deployment.yaml --namespace superset
	kubectl create -f ${ENV_WORK_DIR}deployment/service.yaml --namespace superset
	kubectl create -f ${ENV_WORK_DIR}deployment/pvc.yaml --namespace superset

.PHONY: delete-postgres
delete-postgres:
	kubectl delete -f ${ENV_WORK_DIR}deployment/secrets.yaml --namespace superset
	kubectl delete -f ${ENV_WORK_DIR}deployment/deployment.yaml --namespace superset
	kubectl delete -f ${ENV_WORK_DIR}deployment/service.yaml --namespace superset
	kubectl delete -f ${ENV_WORK_DIR}deployment/pvc.yaml --namespace superset