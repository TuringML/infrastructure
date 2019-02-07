# WIP

Kubeflow is installed via Ansible but how to serve the model still needs some investigation in how to automatize it.
I managed to run the Github Issues Summarization model from this [tutorial](https://aws.amazon.com/it/blogs/opensource/kubeflow-amazon-eks/). I need to isolate the information that are always common for every model and automatize it in our Turing Pipeline.

## Serving Jupyter Notebooks

In order to be able to serve the Jupyter notebooks so that the Data Scientist is able to perform their job, it is necessary to run the following command:

```bash
kubectl port-forward svc/tf-hub-lb -n ${NAMESPACE} 8080:80
```

In this way we can create a new Jupyter notebook by spinning up a new POD in our cluster. Probably we shoudl write an ingress file to access the Jupyter Hub in a easier way otherwise port-forwarding is not the best.



Once the user has created the model, they need to save it in S3. what we can do is to prepare a Docker image with the aws-sdk for python already installed (boto3) so that they can use it directly. **One issue could be credentials.** Not everybody has access to S3 but I think that we can let them to use the S3 bucket that we create when we spinup Kubernetes. Another idea would be to create a separate bucket for their models.

We must provide a Docker Image containing the Jupyter Notebook and the necessary files to serve the model in production. The files that are necessary are:

1. `MyModel.py` in which the user needs to simply read the model and call the predict function (see https://github.com/SeldonIO/seldon-core/blob/master/docs/wrappers/python.md#step-2---create-your-source-code)
2. `requirements.txt` where the user will put all the packages that are needed to make the model running (maybe with some pre-filled ones)
3. `.s2i/environment` where the user will simply change the **NAME** property
4. `my-modelipynb` basically the jupyter notebook where the user will run their experiments
5. `README.md` containing some basic instructions on what they have to do.

The user will have to read the README in which they have to rename the files, fill up the functions, etc. Once this is done, then they can proceed to next step.


## Serving a model

Serving the model can be a bit more elaborate and we need to find the proper way to achieve the correct result. The Data Scientist has the task to create some files within our platform so that we can continue the whole flow to production. The details are explained in this [tutorial](https://github.com/SeldonIO/seldon-core/blob/master/docs/wrappers/python.md). In essence we have to do the following steps:

1. Having **Source-to-Image** installed in a basic Docker Image
2. 
<!-- . Once the user drag-n-drop the model into the Playground and click **Deploy** a wercker pipeline will start -->


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