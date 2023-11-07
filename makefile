.PHONY: default
.DEFAULT_GOAL := default

DREPO := artifactory.swisslearninghub.com/docker/galera-swarm

default:
	@docker build -t $(DREPO) .
	@docker tag  $(DREPO) $(DREPO):latest
	@docker push $(DREPO):latest
