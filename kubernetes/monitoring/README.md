# Installation

Assuming that Helm is already installed and that we have permissions to create new releases, do the following:

1. Install Prometheus with `helm install -f values.yaml stable/prometheus --name prometheus --namespace prometheus`
2. Install Grafana with `helm install -f values.yaml stable/grafana --name grafana --namespace grafana`
3. Open the Grafana UI by using the Loadbalancer address and insert the username/password specified in the `values.yml` file

Load the dashboards that are necessary to visualize the right information
