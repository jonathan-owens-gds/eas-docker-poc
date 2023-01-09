ecr_account_number := 684138814448
-include *.credential

# Dockerhub login is required to pull base image.
.PHONY: dockerhub-login
dockerhub-login:
	@echo "Dockerhub Login:";
	@rm -f ~/.docker/config.json;
	@echo ${DOCKER_HUB_ACCESS_TOKEN} | docker login --username ${DOCKER_HUB_USER_NAME} --password-stdin


# ECR login is required to push/pull images in ECR.
.PHONY: ecr-login
ecr-login:
	@echo "ECR Login:";
	@rm -f ~/.docker/config.json;
	@aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com


# Builds
.PHONY: build-all-no-cache
build-all-no-cache:
	$(MAKE) build-base-image-no-cache
	$(MAKE) build-admin-image-no-cache
	$(MAKE) build-api-image-no-cache
	$(MAKE) build-celery-image-no-cache
	$(MAKE) build-postgres-image-no-cache

.PHONY: build-base-image-no-cache
build-base-image-no-cache: dockerhub-login
	@echo "Build base image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-base:latest . -f Dockerfile.eas-base --no-cache

.PHONY: build-admin-image-no-cache
build-admin-image-no-cache: ecr-login
	@echo "Build admin image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-admin:latest . -f Dockerfile.eas-admin --no-cache

.PHONY: build-api-image-no-cache
build-api-image-no-cache: ecr-login
	@echo "Build api image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-api:latest . -f Dockerfile.eas-api --no-cache

.PHONY: build-celery-image-no-cache
build-celery-image-no-cache: ecr-login
	@echo "Build celery image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-celery:latest . -f Dockerfile.eas-celery --no-cache

.PHONY: build-postgres-image-no-cache
build-postgres-image-no-cache: ecr-login
	@echo "Build postgres image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-postgres:latest . -f Dockerfile.eas-postgres --no-cache


.PHONY: build-all
build-all:
	$(MAKE) build-base-image
	$(MAKE) build-admin-image
	$(MAKE) build-api-image
	$(MAKE) build-celery-image
	$(MAKE) build-postgres-image

.PHONY: build-base-image
build-base-image: dockerhub-login
	@echo "Build base image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-base:latest . -f Dockerfile.eas-base

.PHONY: build-admin-image
build-admin-image: ecr-login
	@echo "Build admin image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-admin:latest . -f Dockerfile.eas-admin

.PHONY: build-api-image
build-api-image: ecr-login
	@echo "Build api image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-api:latest . -f Dockerfile.eas-api

.PHONY: build-celery-image
build-celery-image: ecr-login
	@echo "Build celery image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-celery:latest . -f Dockerfile.eas-celery

.PHONY: build-postgres-image
build-postgres-image: ecr-login
	@echo "Build postgres image:";
	@docker build -t ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-postgres:latest . -f Dockerfile.eas-postgres


# Pushes
.PHONY: push-all
push-all:
	$(MAKE) push-base-image
	$(MAKE) push-admin-image
	$(MAKE) push-api-image
	$(MAKE) push-celery-image
	$(MAKE) push-postgres-image

.PHONY: push-base-image
push-base-image: ecr-login
	@echo "Push base image:";
	@docker push ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-base:latest

.PHONY: push-admin-image
push-admin-image: ecr-login
	@echo "Push admin image:";
	@docker push ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-admin:latest

.PHONY: push-api-image
push-api-image: ecr-login
	@echo "Push api image:";
	@docker push ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-api:latest

.PHONY: push-celery-image
push-celery-image: ecr-login
	@echo "Push celery image:";
	@docker push ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-celery:latest

.PHONY: push-postgres-image
push-postgres-image: ecr-login
	@echo "Push postgres image:";
	@docker push ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-postgres:latest
