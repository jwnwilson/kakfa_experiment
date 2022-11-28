up:
	docker-compose up -d

down:
	docker-compose down

# Python Confluent_kafka library
confluent_reader: up
	cd ./src/confluent_kafka && python consumer.py getting_started.ini

confluent_writer: up
	cd ./src/confluent_kafka && python producer.py getting_started.ini

# Python Faust library
faust_consumer: up
	cd ./src/faust && faust -A consumer worker -l info

faust_writer: up
	cd ./src/faust && python producer.py purchace

# Default Kafka commands
create_topic: up
	docker compose exec broker \
		kafka-topics --create \
			--topic purchases \
			--bootstrap-server localhost:9092 \
			--replication-factor 1 \
			--partitions 1

write_message: up
	docker exec --interactive --tty broker \
		kafka-console-producer --bootstrap-server broker:9092 \
		--topic quickstart

read_message: up
	docker exec --interactive --tty broker \
		kafka-console-consumer --bootstrap-server broker:9092 \
		--topic quickstart \
		--from-beginning
