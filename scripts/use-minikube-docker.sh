#!/usr/bin/env sh
# work around wrapper script until I can figure out how to set these env variables
# in the Makefile. `eval` doesn't work (delegates to Make's `eval`)
eval "$(minikube -p minikube docker-env)"
"$@"