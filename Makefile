
.PHONY: build-and-run
build-and-run:
	$(MAKE) build
	$(MAKE) run

.PHONY: build
build:
	docker build --tag turingml/terraform:0.1.0 docker/terraform/.

.PHONY: run
run:
	docker run -it \
	-e AWS_ACCESS_KEY_ID=$$(aws configure get aws_access_key_id) \
	-e AWS_SECRET_ACCESS_KEY=$$(aws configure get aws_secret_access_key) \
	-e AWS_REGION=$$(aws configure get region) \
	--mount src=$(PWD),target=/var/infrastructure,type=bind \
	turingml/terraform:0.1.0 /bin/sh

.PHONY: all
all:
	@echo create all
