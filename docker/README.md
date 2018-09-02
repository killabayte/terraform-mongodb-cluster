# Project Title

Custom mongodb instance based on pure Centos7 docker image

## Getting Started

1. Build your image:
```
docker build -t ${YOUR_IMAGE_NAME} .
```
2. Run it
```
docker run -td -p 27017:27017 -p 27018:27018 -p 27019:27019 -v /tmp/data/mongodb_data:/var/lib/mongodb -v /tmp/data/mongodb_logs:/var/log/mongodb mongodb
```
"/tmp/data/mongodb_data" and "/tmp/data/mongodb_logs"- this is path on your local machine where you run docker, so be attentive and create manually this folders before run, or just use others, up to you
3. docker ps -a
```
check you newly created container, and start use it
```

### Prerequisites

Docker software installed on your local machine

## Deployment

After docker build you could push this image to your own docker.hub repository and use it

```
docker login 
docker tag ${YOUR_IMAGE_NAME} ${DOCKER_HUB_USER_ID}/${YOUR_IMAGE_NAME}:${SPECIAL_TAG}
docker push ${DOCKER_HUB_USER_ID}/${YOUR_IMAGE_NAME}:${SPECIAL_TAG}
docker pull ${DOCKER_HUB_USER_ID}/${YOUR_IMAGE_NAME}:${SPECIAL_TAG}
docker run -td -p 27017:27017 -p 27018:27018 -p 27019:27019 -v /tmp/data/mongodb_data:/var/lib/mongodb -v /tmp/data/mongodb_logs:/var/log/mongodb mongodb
``` 

## The end
