include zookeeper/Makefile nifi/Makefile

.PHONY: all
all:
	ENV_WORK_DIR=${PWD}/zookeeper/ $(MAKE) create-zookeeper
	ENV_WORK_DIR=${PWD}/nifi/ $(MAKE) create-nifi

.PHONY: delete
delete:
	ENV_WORK_DIR=${PWD}/nifi/ $(MAKE) delete-nifi
	ENV_WORK_DIR=${PWD}/zookeeper/ $(MAKE) delete-zookeeper
	$(MAKE) clean

# Remove all Released persistent volumes
# TODO: make it in Makefile, this is ridiculous
.PHONY: clean
clean:
	exec ./clean.sh

# Adding monitoring dashboard:
dashboard:
	exec ansible-playbook grafana-dashboard.yaml -e grafana_url=http://$(kubectl get svc -n grafana | awk 'NR >1 { print $4 }')
