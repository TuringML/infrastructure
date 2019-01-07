include postgres/Makefile superset/Makefile

.PHONY: all
all:
	kubectl create ns superset	
	ENV_WORK_DIR=${PWD}/postgres/ $(MAKE) create-postgres
	ENV_WORK_DIR=${PWD}/superset/ $(MAKE) create-superset

.PHONY: delete
delete:
	ENV_WORK_DIR=${PWD}/postgres/ $(MAKE) delete-postgres
	ENV_WORK_DIR=${PWD}/superset/ $(MAKE) delete-superset
	kubectl delete ns superset
	$(MAKE) clean

# Remove all Released persistent volumes
# TODO: make it in Makefile, this is ridiculous
.PHONY: clean
clean:
	exec ./clean.sh
