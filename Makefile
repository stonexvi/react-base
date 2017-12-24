DOCKER_IMAGE_NAME = react_app
DOCKER_COMPOSE_CMD = docker-compose

build:
    $(DOCKER_COMPOSE_CMD) build ./ $(DOCKER_IMAGE_NAME)

package-install:
    $(DOCKER_COMPOSE_CMD) npm install

start: build package-install
    $(DOCKER_COMPOSE_CMD) up