all : up

up : 
		@docker-compose -f ./srcs/docker-compose.yml up --build -d

start : 
		@docker-compose -f ./srcs/docker-compose.yml start

down : 
		@docker-compose -f ./srcs/docker-compose.yml down -v
		@sudo rm -rf /home/rayan/volumes/wordpress/*
		@sudo rm -rf /home/rayan/volumes/mariadb/*

stop : 
		@docker-compose -f ./srcs/docker-compose.yml stop

status : 
		@docker-compose -f ./srcs/docker-compose.yml ps

logs :
		@docker-compose -f ./srcs/docker-compose.yml logs
