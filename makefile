up:
	docker-compose up -d

down:
	docker-compose down

create_topic:
	docker compose exec broker \
		kafka-topics --create \
			--topic purchases \
			--bootstrap-server localhost:9092 \
			--replication-factor 1 \
			--partitions 1

write_message:
	docker exec --interactive --tty broker \
		kafka-console-producer --bootstrap-server broker:9092 \
		--topic quickstart

read_message:
	docker exec --interactive --tty broker \
		kafka-console-consumer --bootstrap-server broker:9092 \
		--topic quickstart \
		--from-beginning