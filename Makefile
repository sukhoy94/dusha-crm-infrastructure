run:
	@docker stop $$(docker ps -aq)
	@docker compose up -d
build:
	@docker compose down
	@docker compose build
stop:
	@docker compose stop

rebuild_app:
	@docker compose up app --build -d

down:
	@docker compose down --remove-orphans