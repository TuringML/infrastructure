
.PHONY=expose-overlord
expose-overlord:
	kubectl expose deployment druid-overlord --type=LoadBalancer --name=druid-overlord-external -n druid

.PHONY=expose-coordinator
expose-coordinator:
	kubectl expose deployment druid-coordinator --type=LoadBalancer --name=druid-coordinator-external -n druid

.PHONY=expose-broker
expose-broker:
	kubectl expose deployment druid-broker --type=LoadBalancer --name=druid-broker-external -n druid
