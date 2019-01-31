{
  global: {
    // User-defined global parameters; accessible to all component and environments, Ex:
    // replicas: 4,
  },
  components: {
    // Component-level parameters, defined initially from 'ks prototype use ...'
    // Each object below should correspond to a component in the components/ directory
    "kubeflow-core": {
      AmbassadorImage: "quay.io/datawire/ambassador:0.30.1",
      AmbassadorServiceType: "ClusterIP",
      StatsdImage: "quay.io/datawire/statsd:0.30.1",
      centralUiImage: "gcr.io/kubeflow-images-public/centraldashboard:v0.2.1",
      cloud: "null",
      disks: "null",
      jupyterHubAuthenticator: "null",
      jupyterHubImage: "gcr.io/kubeflow/jupyterhub-k8s:v20180531-3bb991b1",
      jupyterHubServiceType: "ClusterIP",
      jupyterNotebookPVCMount: "/home/jovyan",
      jupyterNotebookRegistry: "gcr.io",
      jupyterNotebookRepoName: "kubeflow-images-public",
      name: "kubeflow-core",
      namespace: "null",
      reportUsage: "false",
      tfDefaultImage: "null",
      tfJobImage: "gcr.io/kubeflow-images-public/tf_operator:v0.2.0",
      tfJobUiServiceType: "ClusterIP",
      tfJobVersion: "v1alpha2",
      usageId: "unknown_cluster",
    },
  },
}
