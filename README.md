# Local Infrastructure

A local playground for infrastructure: kubernetes, argo workflows, kustomize, skaffold, helm, etc.


## Install dependencies and useful utilities for working with Kubernetes

```shell
$ brew install minikube kubectl kubectx kustomize k9s
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

# create argo namespace to host argo workflows
$ kubectl create namespace argo
$ kubens argo 

# deploy argo
$ kustomize build k8s/tools | kubectl apply -n argo -f -  

# PLAYGROUND ONLY! role bindings for argo
$ kubectl create rolebinding default-admin --clusterrole=admin --serviceaccount=argo:default -n argo

# deploy everything else in project
$ kustomize build k8s | kubectl apply -n argo -f -  
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
