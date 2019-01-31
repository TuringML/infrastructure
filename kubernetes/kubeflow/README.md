# Installation

Install Ksonnet:
- `wget https://github.com/ksonnet/ksonnet/releases/download/v0.13.1/ks_0.13.1_linux_amd64.tar.gz`
- `tar zxf ks_0.13.1_linux_amd64.tar.gz`
- `mv ks_0.13.1_linux_amd64/ks /usr/bin`
- `rm -rf ks_0.13.1_linux_amd64`

Export variables:

```bash
export KUBEFLOW_SRC=kubeflow
export KUBEFLOW_TAG=v0.2.0-rc.1
export KFAPP=turingml
export GITHUB_TOKEN=a2bea78af5f8e6e042b5cae7b920e07dde3c2dbd
```

Change the Github Token with the TuringML bot-user. This is necessary to avoid the API Rate Limiter for anonymous users of GitHub.

Steps:
- `kubectl create ns kubeflow`
- `ks init ksonnet-kubeflow --namespace kubeflow`
- `cd ksonnet-kubeflow`
- `ks env add cloud --namespace kubeflow`
- `ks registry add kubeflow github.com/kubeflow/kubeflow/tree/${KUBEFLOW_TAG}/kubeflow`
- `ks pkg install kubeflow/core@${KUBEFLOW_TAG}`
- `ks pkg install kubeflow/tf-serving@${KUBEFLOW_TAG}`
- `ks pkg install kubeflow/tf-job@${KUBEFLOW_TAG}`
- `ks pkg install kubeflow/seldon`
- `ks pkg install kubeflow/argo`
- `ks generate core kubeflow-core --name=kubeflow-core --cloud=aws`
- `ks param set kubeflow-core reportUsage true`
- `ks param set kubeflow-core jupyterHubServiceType LoadBalancer`
- `ks apply cloud`

The steps above will make Kubeflow and Jupyter notebooks available to the user.

==========================================================================================

**Now, we need to find a way to train and deploy models with tensorflow-training and tensorflow-serving**

### Training a model

cat <<EOF | kubectl apply -f -
apiVersion: "kubeflow.org/v1alpha1"
kind: "TFJob"
metadata:
  name: "example-job"
spec:
  replicaSpecs:
    - replicas: 1
      tfReplicaType: MASTER
      template:
        spec:
          containers:
            - image: gcr.io/tf-on-k8s-dogfood/tf_sample:dc944ff
              name: tensorflow
          restartPolicy: OnFailure
    - replicas: 1
      tfReplicaType: WORKER
      template:
        spec:
          containers:
            - image: gcr.io/tf-on-k8s-dogfood/tf_sample:dc944ff
              name: tensorflow
          restartPolicy: OnFailure
    - replicas: 2
      tfReplicaType: PS
      template:
        spec:
          containers:
            - image: gcr.io/tf-on-k8s-dogfood/tf_sample:dc944ff
              name: tensorflow
          restartPolicy: OnFailure
EOF


==========================================================================================

### Serving a model

After training the model, you can serve it with:

```bash
export MODEL_COMPONENT=serveInception
export MODEL_NAME=inception
export MODEL_PATH=s3://turingml-kubeflow-models/inception
```

- `ks generate tf-serving ${MODEL_COMPONENT} --name=${MODEL_NAME}`

Create a secret for S3:

cat <<EOF | kubectl apply -f -
apiVersion: v1
metadata:
  name: s3access
  namespace: kubeflow
data:
  accessKeyID: QUtJQUoyVkpZTjVYQU1YQ0RBQ0E=
  secretAccessKey: bWdrR1NaaVpEY3poY1RldXVNdUdUdW12Y3JiWm91VVJvRXk3eGlyTQ==
kind: Secret
EOF

- `ks param set --env cloud ${MODEL_COMPONENT} modelPath ${MODEL_PATH}`
- `ks param set --env cloud ${MODEL_COMPONENT} s3Enable True`
- `ks param set --env cloud ${MODEL_COMPONENT} s3SecretName s3access`
- `ks param set --env cloud ${MODEL_COMPONENT} s3SecretAccesskeyidKeyName accessKeyID`
- `ks param set --env cloud ${MODEL_COMPONENT} s3SecretSecretaccesskeyKeyName secretAccessKey`
- `ks param set --env cloud ${MODEL_COMPONENT} s3UseHttps '0'`
- `ks param set --env cloud ${MODEL_COMPONENT} s3VerifySsl '0'`
- `ks param set --env cloud ${MODEL_COMPONENT} s3AwsRegion eu-west-1`
- `ks param set --env cloud ${MODEL_COMPONENT} serviceType LoadBalancer`
- `ks apply cloud -c ${MODEL_COMPONENT}`
