# Install

Follow these steps:

1. Add tag in AustoScaling Group `k8s.io/cluster-autoscaler/enabled` with value `true` and delete `k8s.io/cluster-autoscaler/disabled`
2. Install Autoscaler with helm

```bash
helm install stable/cluster-autoscaler --name autoscaler --set image.tag=v1.3.1 --set rbac.create=true --set autoDiscovery.clusterName={{ clustername }} --set cloudProvider=aws --set awsRegion={{ region }} --set sslCertPath=/etc/kubernetes/pki/ca.crt
```