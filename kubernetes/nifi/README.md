# Kubernetes NiFi Cluster

A nifi cluster running in kubernetes-nifi-cluster

## Prerequisites

- Requires zookeeper, you could use zookeeper from this repository under
`zookeeper`
running in the namespace zookeeper (three nodes referenced is optimal)

- Requires [kubernetes](https://kubernetes.io/)

- Requires an image for [NiFi](https://hub.docker.com/r/bjormooijekind/nifi/) could
either be pulled directly `docker pull bjornmooijekind/nifi:1.8.0` or build (see
docker folder).

## Deploy
Please use the Makefile in order to deploy the cluster on your kubernetes
cluster. NiFi is fixed to a `nifi` namespace.

First deploy the ZooKeeper cluster by the following commands:
`$ cd zookeeper`
`$ make all`

Then deploy NiFi by following commands:
`$ cd nifi`
`$ make all`
Exposing NiFi UI could be done with:
`$ make expose`

To delete cluster run:
`$ make delete`
for both NiFi and ZooKeeper
