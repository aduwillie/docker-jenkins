#!/bin/bash

docker image build --no-cache \
--tag quay.io/shazchaudhry/docker-jenkins:latest --build-arg GIT_COMMIT=$(git log -1 --format=%H) .
# Run this command to find git commit:-
#docker inspect quay.io/shazchaudhry/docker-jenkins | jq '.[].ContainerConfig.Labels'

docker image ls

echo "admin" | docker secret create jenkins-user -
echo "admin" | docker secret create jenkins-pass -

docker stack deploy --compose-file docker-compose.yml jenkins

docker stack ls

docker stack services jenkins
