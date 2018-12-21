all:
	kubectl create ns nifi
	kubectl create -f deployment/ingress.yaml --namespace=nifi
	kubectl create -f deployment/service.yaml --namespace=nifi
	kubectl create -f deployment/statefulset.yaml --namespace=nifi

delete:
	kubectl delete -f deployment/ingress.yaml --namespace=nifi
	kubectl delete -f deployment/service.yaml --namespace=nifi
	kubectl delete -f deployment/statefulset.yaml --namespace=nifi
	kubectl delete ns nifi

expose:
	kubectl expose service nifi -n nifi --type=LoadBalancer --port=8080 --target-port=8080 --name=nifi-http
