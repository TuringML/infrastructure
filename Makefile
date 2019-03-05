ORG ?= turingml
REPO ?= infra
VERSION ?= 0.1.0

.PHONY: config
config:
	aws eks update-kubeconfig --name ${CLIENT_ID}-eks-cluster
	aws eks describe-cluster --name ${CLIENT_ID}-eks-cluster --query cluster.status
	kubectl get pods --all-namespaces
	kubectl apply -f tiller.yaml
	helm init --upgrade --service-account tiller

.PHONY: eksctl-create
eksctl-create:
	eksctl create cluster --name=cluster-1 --nodes=2 --nodes-min=2 --nodes-max=3 --node-type=c5.xlarge --region=eu-west-1 --tags environment=staging

.PHONY: delete-istio
delete-istio:
	helm delete istio --purge \
	kubectl delete ns istio-system \
	kubectl delete -f install/kubernetes/helm/istio/templates/crds.yaml -n istio-system

.PHONY: get-secrets
get-secrets:
	kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')

.PHONY: proxy
proxy:
	kubectl proxy --address='0.0.0.0' --port=8001 --accept-hosts='.*'

.PHONY: pull
pull:
	docker pull ${ORG}/${REPO}:${VERSION}

.PHONY: build-push
build-push:
	$(MAKE) build
	$(MAKE) push

.PHONY: build-run
build-run:
	$(MAKE) build
	$(MAKE) run

.PHONY: build
build:
	docker build --tag ${ORG}/${REPO}:${VERSION} docker/${REPO}/.

.PHONY: push
push:
	docker push ${ORG}/${REPO}:${VERSION}

.PHONY: run
run:
	docker run -it \
	--name infra \
	-e AWS_ACCESS_KEY_ID=$$(aws configure get aws_access_key_id) \
	-e AWS_SECRET_ACCESS_KEY=$$(aws configure get aws_secret_access_key) \
	-e AWS_DEFAULT_REGION=$$(aws configure get region) \
	-e CLIENT_ID=${CLIENT_ID} \
	-p 8001:8001 \
	-p 8200:8200 \
	--mount src=$(PWD),target=/var/infrastructure,type=bind \
	${ORG}/${REPO}:${VERSION} /bin/sh

.PHONY: all
all:
	@echo create all
