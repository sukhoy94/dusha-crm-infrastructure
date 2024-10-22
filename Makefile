run:
	@docker stop $$(docker ps -aq)
	@docker compose up -d
stop:
	@docker compose stop
