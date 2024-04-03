start:
	# Starts all containers
	docker-compose up -d bdd

stop:
	# Stops all containers
	docker-compose stop

restart:
	# Restarts all containers
	docker-compose restart

remove:
	# Removes the containers and default network, but keeps database
	docker-compose down

destroy:
	# Destroys all containers, networks, volumes and images
	docker-compose down -v --rmi local

build-image:
	# Builds or rebuilds images
	docker-compose up --build -d

bash:
	# Opens a bash terminal into the bdd container
	docker exec -it bdd bash

status:
	# Show the status of running containers
	docker-compose ps