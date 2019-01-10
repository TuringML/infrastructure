include zookeeper/Makefile kafka/Makefile

.PHONY: all
all:
	kubectl create ns kafka
	ENV_WORK_DIR=${PWD}/zookeeper/ $(MAKE) create-zookeeper
	ENV_WORK_DIR=${PWD}/kafka/ $(MAKE) create-kafka

.PHONY: delete
delete:
	ENV_WORK_DIR=${PWD}/kafka/ $(MAKE) delete-kafka
	ENV_WORK_DIR=${PWD}/zookeeper/ $(MAKE) delete-zookeeper
	kubectl delete ns kafka
	$(MAKE) clean

# Remove all Released persistent volumes
# TODO: make it in Makefile, this is ridiculous
.PHONY: clean
clean:
	exec ./clean.sh