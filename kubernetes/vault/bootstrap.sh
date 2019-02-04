#!/bin/sh

export VAULT_POD=$(kubectl get pods --namespace vault -l "app=vault" -o jsonpath="{.items[0].metadata.name}")

export VAULT_TOKEN=$(kubectl logs -n vault $VAULT_POD | grep 'Root Token' | cut -d' ' -f3)

export VAULT_ADDR=http://127.0.0.1:8200

# run this on a second terminal
kubectl port-forward -n vault $VAULT_POD 8200 &

echo $VAULT_TOKEN | vault login -

vault status
