# docker_in_docker

Goal of this toy repo is to setup a working set of images
so I can easily recreate issue I see in my web app where sometimes

	docker-compose up -d 

works correctly sometimes it fails to relaunch freshly rebuilt docker images.

My system executes all docker commands from inside a container

see forum question I posed at     
https://devops.stackexchange.com/questions/3773/docker-compose-fails-to-recognize-when-containers-are-rebuilt


