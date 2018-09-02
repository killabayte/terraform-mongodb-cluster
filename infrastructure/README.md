# Project Title

Terraform Mongodb Cluster infrastructure on AWS

## Getting Started

1.Generate your own bastion public key
```
ssh-keygen -f bastionkey
```
2. Run terraform
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

Terraform, aws cli, docker on your local machine. Also make sure you was run aws configure and put your special credentials for AWS Account, otherwise you will be need to fill it manually 
```
aws configure
```
## The end
