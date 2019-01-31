# ZooKeeper cluster

## Prerequisites
- Requires [kubernetes](https://kubernetes.io/) Minikube or DC/OS version
running and kubectl installed

## Deploy
Please use the Makefile in order to deploy the cluster on your kubernetes
cluster. ZooKeeper is fixed to a `zookeeper` namespace.

To create a cluster run:

`$ make all`

To delete a cluster run:

`$ make delete`
