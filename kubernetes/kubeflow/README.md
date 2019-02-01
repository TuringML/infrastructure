# WIP

Kubeflow is installed via Ansible but how to serve the model still needs some investigation in how to automatize it.
I managed to run the Github Issues Summarization model from this [tutorial](https://aws.amazon.com/it/blogs/opensource/kubeflow-amazon-eks/). I need to isolate the information that are always common for every model and automatize it in our Turing Pipeline. 

## Serving a model

After training the model, you can serve it with:

```bash
export MODEL_COMPONENT=serveInception
export MODEL_NAME=inception
export MODEL_PATH=s3://turingml-kubeflow-models/inception
```

ks generate seldon-serve-simple issue-summarization-model-serving \
--name=issue-summarization \
--image=turingml/github-issue-summarization:0.2 \
--replicas=2

## creates the pods
ks apply default -c issue-summarization-model-serving