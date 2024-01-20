.PHONY: db-mysql

init-env:
	minikube start --cpus=2 --disk-size='20gb'
	kubectx minikube
	kubectl apply -k k8s/base/tools
	kubectl apply -k k8s

build-migrations:
	./scripts/use-minikube-docker.sh docker build -t migrate:minikube migrations

db-ch:
	kubectl run -n clickhouse -it --rm --image=clickhouse/clickhouse-server:latest --restart=Never clickhouse-client \
		-- clickhouse-client --host clickhouse --port=9000

db-ch-up: build-migrations
	kubectl run migrate -n clickhouse -it --rm --image=migrate:minikube --restart=Never -- \
		/migrate \
		-source 'file://migrations/clickhouse' \
		-database 'clickhouse://clickhouse:9000?username=default&database=amperon&x-multi-statement=true' \
		up

db-mysql:
	kubectl run -n mysql -it --rm --image=mysql:latest --restart=Never mysql-client -- mysql -h mysql -D amperon -proot

db-mysql-up: build-migrations
	kubectl run migrate -n mysql -it --rm --image=migrate:minikube --restart=Never  -- \
		/migrate \
		-source 'file://migrations/mysql' \
		-database 'mysql://root:root@tcp(mysql:3306)/amperon' \
		up

minikube-docker:
	minikube -p minikube docker-env > "$@"