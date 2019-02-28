# Installation

Assuming that Helm is already installed and that we have permissions to create new releases, do the following:

1. Install Prometheus with `helm install -f values.yaml stable/prometheus --name prometheus --namespace prometheus`
2. Install Grafana with `helm install -f values.yaml stable/grafana --name grafana --namespace grafana`
3. Open the Grafana UI by using the Loadbalancer address and insert the username/password specified in the `values.yml` file

Load the dashboards that are necessary to visualize the right information. In case you want to access the Prometheus UI, you need to open the port 30900 in the Security Group where the Kubernetes Workers are. After you've done that, you can use the Public DNS of the worker machine and access it via browser. An example of URL is `http://54.21.354.2:30900/target`.

kubectl expose service prometheus-pushgateway -n prometheus --type=LoadBalancer --port=9091 --target-port=9091 --name=prometheus-http

kubectl expose service prometheus-server -n prometheus --type=LoadBalancer --port=9095 --target-port=30900 --name=prometheus-server
