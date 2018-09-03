## Synopsis

This project contain two folder: 

* docker - this is custom version mongodb on aboard, could de a builded as single docker image, see README.md inside
* infrastructure - this is terraform code for aws infrastructure what will create all necessary for mongodb-cluster (VPC, Subnets, IG, NAT, SG, Bastion, 3Mongodb instances based on EC2(t2.micro), Route53), see README.md inside

```
./docker/README.md - contain all necessary information about docker
```

```
./infrastructure/README.md -contain all necessary information about terraform and aws
```

## NotaBene

Mongodb will be installed on aws instances as part of user-data, what will do pulling from docker.hub and run custom mongodb docker container on it. So basicaly docker and terraform could be used separatly from each other

## The end

