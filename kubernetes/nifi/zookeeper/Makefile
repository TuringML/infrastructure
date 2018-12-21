all:
	kubectl create ns zookeeper
	kubectl create -f deployment/poddisruptionbudget.yaml --namespace zookeeper
	kubectl create -f deployment/service.yaml --namespace zookeeper
	kubectl create -f deployment/statefulset.yaml --namespace zookeeper

delete:
	kubectl delete -f deployment/poddisruptionbudget.yaml --namespace zookeeper
	kubectl delete -f deployment/service.yaml --namespace zookeeper
	kubectl delete -f deployment/statefulset.yaml --namespace zookeeper
	kubectl delete ns zookeeper
