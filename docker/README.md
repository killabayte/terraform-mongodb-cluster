# Project Title

Custom mongodb based on pure Centos7 docker image
installed version: 3.4

## Short description

Project builded on pure centos7:latest docker image, contain mongodb v.3.4, main port exposed, mongodb data and logs should be mounted from host folder as volumes, see example below 

## Getting Started

1. How to build image? From this folder, run docker build command "docker build -t ${YOUR_IMAGE_NAME}:latest ." from terminal:
```
docker build -t mongodb:v3.4 .
```

2. Run it on your local machine, remember docker should be installed before
```
mkdir -p /tmp/data/mongodb_logs - create special folder for mongodb logs from container
mkdir -p /tmp/data/mongodb_data - create special folder for mongodb data from container

docker run -td -p 27017:27017 -p 27018:27018 -p 27019:27019 -v /tmp/data/mongodb_data:/var/lib/mongodb -v /tmp/data/mongodb_logs:/var/log/mongodb mongodb - And finaly run docker container with mongodb
```
"/tmp/data/mongodb_data" and "/tmp/data/mongodb_logs"- this is path on your local machine where you run docker, so be attentive and create manually this folders before run, or just use others, up to you

3. Check you newly created container, and start use it
```
docker ps -a
```
It should be healty, and with status "UP", also folders what was empty before start "/tmp/data/mongodb_data", "/tmp/data/mongodb_logs" must be with some data, it data from docker mongodb container

4. Clean up
```
docker stop $(docker ps -a)
docker rm ${docker ps -a)
```
It will stop and delete all docker containers on local machine

### Prerequisites

docker-ce: latest

## Deployment

5. After docker build you could push this image to your own docker.hub repository and use it on remote instances

```
docker login 
docker tag ${YOUR_IMAGE_NAME} ${DOCKER_HUB_USER_ID}/${YOUR_IMAGE_NAME}:${SPECIAL_TAG}
docker push ${DOCKER_HUB_USER_ID}/${YOUR_IMAGE_NAME}:${SPECIAL_TAG}
```

``` 
docker pull ${DOCKER_HUB_USER_ID}/${YOUR_IMAGE_NAME}:${SPECIAL_TAG}
mkdir -p /tmp/data/mongodb_logs
mkdir -p /tmp/data/mongodb_logs
docker run -td -p 27017:27017 -p 27018:27018 -p 27019:27019 -v /tmp/data/mongodb_data:/var/lib/mongodb -v /tmp/data/mongodb_logs:/var/log/mongodb mongodb
``` 
Will run docker container from docker.hub on your server

## The end
