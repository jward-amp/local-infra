.PHONY: db-mysql

init-env:
	minikube start --cpus=2 --disk-size='20gb'
	kubectl apply -k k8s/base/tools

db-mysql:
	kubectl run -n mysql -it --rm --image=mysql:latest --restart=Never mysql-client -- mysql -h mysql -proot