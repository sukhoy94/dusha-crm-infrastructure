run:
	@docker stop $$(docker ps -aq)
	@docker compose up -d

stop:
	@docker compose stop

rebuild_app:
	@docker compose up app --build -d