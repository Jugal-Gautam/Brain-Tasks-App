#!/bin/bash
set -e

echo "Reading appspec.yml..."

MANIFESTS=$(yq e '.Resources[0].Kubernetes.Manifest[]' appspec.yml)

echo "Updating kubeconfig..."
aws eks update-kubeconfig --name braintasks-cluster --region us-east-1

echo "Applying Kubernetes manifests..."

for FILE in $MANIFESTS; do
  echo "Applying $FILE"
  kubectl apply -f $FILE
done

echo "Deployment completed successfully."
