DOCKERLESS_VERSION ?= 1.44.1
IMAGE_NAME ?= cloudhut/dockerless:$(DOCKERLESS_VERSION)
TAG = $(DOCKERLESS_VERSION)

build:
	docker build -t $(IMAGE_NAME) -t $$DOCKER_ID_USER/dockerless:latest .

pull:
	docker pull $(IMAGE_NAME)

shell:
	docker run --rm -it -v $(PWD):/opt/app $(IMAGE_NAME) bash

tagdocker:
	docker tag ${IMAGE_NAME} $$DOCKER_ID_USER/dockerless:latest

dockerpush:
	docker push $$DOCKER_ID_USER/dockerless

tag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)