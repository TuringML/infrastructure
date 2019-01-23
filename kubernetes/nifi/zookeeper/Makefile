.PHONY: create-zookeeper
create-zookeeper:
	kubectl create ns nifi-zk
	kubectl create -f ${ENV_WORK_DIR}deployment/poddisruptionbudget.yaml --namespace nifi-zk
	kubectl create -f ${ENV_WORK_DIR}deployment/service-cs.yaml --namespace nifi-zk
	kubectl create -f ${ENV_WORK_DIR}deployment/service-hs.yaml --namespace nifi-zk
	kubectl create -f ${ENV_WORK_DIR}deployment/statefulset.yaml --namespace nifi-zk

.PHONY: delete-zookeeper
delete-zookeeper:
	kubectl delete -f ${ENV_WORK_DIR}deployment/poddisruptionbudget.yaml --namespace nifi-zk
	kubectl delete -f ${ENV_WORK_DIR}deployment/service-cs.yaml --namespace nifi-zk
	kubectl delete -f ${ENV_WORK_DIR}deployment/service-hs.yaml --namespace nifi-zk
	kubectl delete -f ${ENV_WORK_DIR}deployment/statefulset.yaml --namespace nifi-zk
	kubectl delete ns nifi-zk
