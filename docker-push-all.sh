#!/usr/bin/env bash


function note() {
    local GREEN NC
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "\n${GREEN}$@  ${NC}\n" >&2
}

set -e

cd microservices/core/product-service;                note "Packaging product...";         docker build -t product-service .; 
docker push rnulens/product-service:latest; cd -
cd microservices/core/recommendation-service;         note "Packaging recommendation...";  docker build -t recommendation-service .;
docker push rnulens/recommendation-service:latest; cd -
cd microservices/core/review-service;                 note "Packaging review...";          docker build -t review-service .;
docker push rnulens/review-service:latest; cd -
cd microservices/composite/product-composite-service; note "Packaging composite...";       docker build -t product-composite-service .;
docker push rnulens/product-composite-service:latest; cd -

#cd microservices/support/auth-server;                 note "Building auth...";            ./gradlew clean build; cd -
#cd microservices/support/config-server;               note "Building config...";          ./gradlew clean build; cd -
#cd microservices/support/discovery-server;            note "Building discovery...";       ./gradlew clean build; cd -
#cd microservices/support/edge-server;                 note "Building edge...";            ./gradlew clean build; cd -
#cd microservices/support/monitor-dashboard;           note "Building monitor...";         ./gradlew clean build; cd -
#cd microservices/support/turbine;                     note "Building turbine...";         ./gradlew clean build; cd -
#cd microservices/support/zipkin-server;               note "Building zipkin...";          ./gradlew clean build; cd -

#find . -name *SNAPSHOT.jar -exec du -h {} \;

#docker-compose build
