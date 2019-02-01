local env = std.extVar("__ksonnet/environments");
local params = std.extVar("__ksonnet/params").components["issue-summarization-model-serving"];


local k = import "k.libsonnet";
local serve = import "kubeflow/seldon/serve-simple.libsonnet";

// updatedParams uses the environment namespace if
// the namespace parameter is not explicitly set
local updatedParams = params {
  namespace: if params.namespace == "null" then env.namespace else params.namespace,
};

local name = params.name;
local image = params.image;
local namespace = updatedParams.namespace;
local replicas = params.replicas;
local endpoint = params.endpoint;
local pvcName = params.pvcName;

local serveComponents = [
  serve.parts(namespace).serve(name, image, replicas, endpoint, pvcName),
];

local pvcComponent = [
  serve.parts(namespace).createPVC(pvcName),
];

if pvcName != "null" && pvcName != "" then
  k.core.v1.list.new(serveComponents + pvcComponent)
else
  k.core.v1.list.new(serveComponents)
