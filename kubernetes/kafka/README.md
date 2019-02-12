# Kafka cluster with Operators

It installs Zookeeper and Kafka in HA. the file `kafka-cluster.yaml` can be modified to tailor it for our case. The operator is based on the Strimzi work.

## Install Kafka

```shell
kubectl create ns kafka
kubectl apply -f kafka-cluster-operator.yaml
kubectl apply -f kafka-cluster.yaml
kubectl apply -f kafka-connect.yaml
```

## Test Kafka

Create test producer

```shell
kubectl run kafka-producer -ti --image=strimzi/kafka:0.10.0-kafka-2.1.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --broker-list kafka-kafka-bootstrap.kafka:9092 --topic test
```

Create test consumer

```shell
kubectl run kafka-consumer -ti --image=strimzi/kafka:0.10.0-kafka-2.1.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server kafka-kafka-bootstrap.kafka:9092 --topic test --from-beginning
```

You should be able to see the messages created in the producer from the consumer.