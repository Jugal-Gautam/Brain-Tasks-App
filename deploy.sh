#!/bin/bash
set -e

echo "Reading manifest list from appspec.yml (static)..."

# Manifest files listed directly
MANIFESTS="deployment.yaml service.yaml"

echo "Updating kubeconfig..."
aws eks update-kubeconfig --name braintasks-cluster --region us-east-1

echo "Applying Kubernetes manifests..."

for FILE in $MANIFESTS; do
  echo "Applying $FILE"
  kubectl apply -f $FILE
done

echo "Deployment completed successfully."

