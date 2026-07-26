# Terraform AWS Infrastructure (Lesson 7)

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using **Terraform**, **Docker**, **Amazon EKS**, **Amazon ECR**, and **Helm** on AWS.

The project provisions a Kubernetes cluster, stores a Docker image in Amazon ECR, and deploys a Django application using a Helm chart.

## Technologies

* Terraform
* AWS
* Amazon EKS
* Amazon ECR
* Docker
* Kubernetes
* Helm

# Infrastructure

The project creates the following AWS resources:

* Amazon S3 Bucket (Terraform remote state)
* Amazon DynamoDB Table (Terraform state locking)
* Amazon VPC
* 3 Public Subnets
* 3 Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* Amazon Elastic Container Registry (ECR)
* Amazon Elastic Kubernetes Service (EKS)

# Helm Chart

The Helm chart deploys the Django application to the Kubernetes cluster.

Resources included:

* Deployment
* Service (LoadBalancer)
* ConfigMap
* Horizontal Pod Autoscaler (HPA)

Environment variables are provided through a Kubernetes ConfigMap using `envFrom`.


# Docker Image

The Django application is containerized with Docker.

The Docker image is pushed to Amazon Elastic Container Registry (ECR) and used by the Kubernetes Deployment.


# Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

# Kubernetes Commands

```bash
kubectl get nodes
kubectl get pods
kubectl get deployments
kubectl get services
kubectl get hpa
kubectl get configmap
```

---

# Helm Commands

```bash
helm install django-app ./charts/django-app

helm upgrade django-app ./charts/django-app

helm list

helm uninstall django-app
```

# Remote Backend

Terraform state is stored remotely in an Amazon S3 bucket.

State locking is implemented using an Amazon DynamoDB table.

# Notes

* The Django application is deployed using Helm.
* Configuration values are stored in a Kubernetes ConfigMap.
* Horizontal Pod Autoscaler is configured with:

  * Minimum replicas: **2**
  * Maximum replicas: **6**
  * CPU utilization target: **70%**
* The application is exposed through a Kubernetes LoadBalancer Service.


# Cleanup

To avoid unnecessary AWS charges, remove all created resources after completing the assignment.

Terraform resources:

```bash
terraform destroy
```

Helm release:

```bash
helm uninstall django-app
```