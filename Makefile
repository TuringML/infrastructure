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
	-e ONE_PASSWORD_SECRET_KEY=${ONE_PASSWORD_SECRET_KEY} \
	-e ONE_PASSWORD_PASSWORD=${ONE_PASSWORD_PASSWORD} \
	-e ONE_PASSWORD_USER=${ONE_PASSWORD_USER} \
	-e CLIENT_ID=${CLIENT_ID} \
	-p 8001:8001 \
	--mount src=$(PWD),target=/var/infrastructure,type=bind \
	${ORG}/${REPO}:${VERSION} /bin/sh --login

.PHONY: all
all:
	@echo create all

# .PHONY: check-env
# check-env:
# 	$(MAKE) check-one-password-secret
# 	$(MAKE) check-one-password-password
# 	$(MAKE) check-one-password-user
#
# .PHONY: check-one-password-secret
# check-one-password-secret:
# ifndef ONE_PASSWORD_SECRET_KEY
# $(error ONE_PASSWORD_SECRET_KEY is not set)
# endif
#
# .PHONY: check-one-password-password
# check-one-password-password:
# ifndef ONE_PASSWORD_PASSWORD
# $(error ONE_PASSWORD_PASSWORD is not set)
# endif
#
# .PHONY: check-one-password-user
# check-one-password-user:
# ifndef ONE_PASSWORD_USER
# $(error ONE_PASSWORD_USER is not set)
# endif
