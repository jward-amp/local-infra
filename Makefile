.PHONY: db-mysql

init-env:
	minikube start --cpus=2 --disk-size='20gb'
	kubectl apply -k k8s/base/tools
	kubectl apply -k k8s

db-ch:
	kubectl run -n clickhouse -it --rm --image=clickhouse/clickhouse-server:latest --restart=Never clickhouse-client \
		-- clickhouse-client --host clickhouse --port=9000

db-mysql:
	kubectl run -n mysql -it --rm --image=mysql:latest --restart=Never mysql-client -- mysql -h mysql -proot