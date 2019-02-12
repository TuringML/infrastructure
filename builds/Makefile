
.PHONY: build
build:
	packer build \
	-var aws_access_key=$$(aws configure get aws_access_key_id) \
	-var aws_secret_key=$$(aws configure get aws_secret_access_key) \
	vegeta.json
