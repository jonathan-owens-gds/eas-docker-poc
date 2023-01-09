ecr_account_number := 684138814448
-include *.credential

# ECR login is required to push/pull images in ECR.
.PHONY: ecr-login
ecr-login:
	@echo "ECR Login:";
	@rm -f ~/.docker/config.json;
	@aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com


.PHONY: pull-latest-images
pull-latest-images: ecr-login
	docker pull ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-admin:latest
	docker pull ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-api:latest
	docker pull ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-celery:latest
	docker pull ${ecr_account_number}.dkr.ecr.eu-west-1.amazonaws.com/eas-postgres:latest


.PHONY: up
up:
	@$(MAKE) ecr-login
	@docker-compose up