# Terraform AWS Infrastructure (Lesson 5)

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform on AWS.

The infrastructure includes:

- S3 Bucket for storing Terraform state
- DynamoDB table for Terraform state locking
- VPC with public and private subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Amazon Elastic Container Registry (ECR)

# Modules

## s3-backend

Creates resources for remote Terraform state.

Resources:

- Amazon S3 Bucket
- Bucket Versioning
- Server-side Encryption
- DynamoDB Table for state locking


## vpc

Creates AWS networking infrastructure.

Resources:

- VPC
- 3 Public Subnets
- 3 Private Subnets
- Internet Gateway
- Elastic IP
- NAT Gateway
- Public Route Table
- Private Route Table
- Route Table Associations

## ecr

Creates an Amazon Elastic Container Registry.

Features:

- Private ECR Repository
- Image Scan on Push
- Repository Access Policy

# Terraform Commands

```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

# Remote Backend

Terraform state is stored in an Amazon S3 bucket.

State locking is implemented using an Amazon DynamoDB table.

# AWS Resources

The project creates the following AWS resources:

- S3 Bucket
- DynamoDB Table
- VPC
- 3 Public Subnets
- 3 Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Amazon ECR Repository


# Notes

After completing the assignment, remember to remove all AWS resources to avoid unnecessary charges:

```bash
terraform destroy
```
