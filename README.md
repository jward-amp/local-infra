# Local Infrastructure

A local playground for infrastructure: kubernetes, argo workflows, kustomize, skaffold, helm, etc.


## Install dependencies and useful utilities for working with Kubernetes

```shell
$ brew install minikube kubectl kubectx kustomize k9s tools
```


## Starting minikube

```shell
$ minikube start --driver=docker  # can also `podman` or `hyperkit` for the driver
```


## Install Argo Workflows

Follow Argo's [quickstart](https://argo-workflows.readthedocs.io/en/latest/quick-start/), for example:

```shell
# for demo / playground only!
$ kubectl create namespace argo
$ kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.5.3/install.yaml
$ kubectl create rolebinding default-admin --clusterrole=admin --serviceaccount=argo:default -n argo
```

## Apply kubernetes resources

```shell
$ kustomize build k8s | kubectl apply -n argo -f - 
```

