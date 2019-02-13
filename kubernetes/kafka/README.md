# Kafka cluster with Operators

It installs Zookeeper and Kafka in HA. The file `deployment/cluster.yaml` can be modified to tailor it for our case. The operator is based on the Strimzi work.

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

## Stress Test

Run the following commands for the producer

```shell
kubectl run kafka-producer -ti --image=strimzi/kafka:0.10.0-kafka-2.1.0 --rm=true --restart=Never -- bin/kafka-producer-perf-test.sh --topic test --num-records 1500000 --throughput 100000000 --record-size 15000 --producer-props bootstrap.servers=kafka-kafka-bootstrap.kafka:9092
```

Then test the consumer

```shell
kubectl run kafka-consumer -ti --image=strimzi/kafka:0.10.0-kafka-2.1.0 --rm=true --restart=Never -- bin/kafka-consumer-perf-test.sh --broker-list kafka-kafka-bootstrap.kafka:9092 --topic test --messages 100000000 --timeout 9999999
```