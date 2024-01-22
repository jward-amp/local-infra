# Local Infrastructure

A local playground for infrastructure: kubernetes, argo workflows, kustomize, skaffold, helm, etc.


## Install dependencies and useful utilities for working with Kubernetes

```shell
$ brew install argo minikube kubectl kubectx kustomize k9s
```


## Starting minikube

```shell
$ minikube start --driver=docker  # can also `podman` or `hyperkit` for the driver
```


## Install Argo Workflows

FOR DEMO / PLAYGROUND ONLY!!!

```shell
# make sure you are on the right cluster
$ kubectx minikube 

# deploy tools
$ kubectl apply -k k8s/base/tools

# deploy everything else in project
$ kustomize apply -k k8s  
```

## Launch a workflow

```shell
$ argo submit -n argo --from workflowtemplate/echoing-names-everywhere
```

## Clean up

```shell
# stop cluster from running
$ minikube stop

# remove cluster (but not minikube)
$ minikube delete
```
