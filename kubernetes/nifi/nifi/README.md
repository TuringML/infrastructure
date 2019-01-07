# kubernetes-nifi-cluster

A nifi cluster running in kubernetes-nifi-cluster

## Prerequisites

- Requires zookeeper, you could use zookeeper from this repository under
`zookeeper-cluster`
running in the namespace zookeeper (three nodes referenced is optimal)

- Requires [kubernetes](https://kubernetes.io/) Minikube or DC/OS version
running and kubectl installed

- Requires an image for [NiFi](https://hub.docker.com/r/turingml/nifi/) could
either be pulled directly `docker pull turingml/nifi:1.8.0` or build.

## Deploy
Please use the Makefile in order to deploy the cluster on your kubernetes
cluster. NiFi is fixed to a `nifi` namespace.

To create a cluster run:

`$ make all`

In order to expose the UI with a service:

`$ make expose`

NOTE: the NiFi cluster could take some time before it's running. The image is over
1 gb and the election of ZooKeeper is 7 minutes or so. When you see the message in the at `<host>:8080/nifi`: `Cluster is still in the process of voting on the appropriate Data Flow.` You're most likely good to go.

To delete a cluster run:

`$ make delete`
