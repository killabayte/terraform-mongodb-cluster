# Project Title

Terraform Mongodb Cluster infrastructure on AWS

## Getting Started

1. Generate your own bastion public key
```
ssh-keygen -f bastionkey
```
2. Configure your AWS account access
```
aws configure
```
3. Run terraform
```
terraform init
terraform plan -out out.terraform
terraform apply "out.terraform"
```
After approximately 10 minutes, your infrastructure will be ready
```
terraform destroy - will destroy all infrastructure what was created by terraform
``` 
### Prerequisites

Terraform: v0.11.7
aws-cli: 1.15.71
docker-ce: latest

Also make sure you was run "aws configure" and put your special credentials for AWS Account, otherwise you will be need to fill it manually

## Expected Results

Terraform will create on your AWS account 31 resources(without route53), and 35 with route53 if you want enabled it just do next command:
```
mv route53.disabled route53.tf
```
this is was disabled because of fake domain what was used inside "test.com", for future usage please change it to yours own domain instead

## Short aws infrastructure description

After terraform apply you will be able to login to "Bastion" host what was available by ssh and existing in public subnet, but login could be done only with your bastion public key, please see login command below:
```
ssh -i ./bastionkey ec2-user@${BASTION_PUBLIC_IP}
``` 
Also will be created 3 t2.micro mongodb instances with additional 1Tb EBS volume on a board, in private subnet, NOT ACCESSIBLE from any public resources, only from instanses in special security group what was allowed to do this

## The end

