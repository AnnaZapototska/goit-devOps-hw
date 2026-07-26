terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "s3_backend" {
  source = "./modules/s3-backend"

  bucket_name = "anna-terraform-state-912096796684"
  table_name  = "terraform-locks"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name       = "lesson-5-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]

  private_subnets = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]

  availability_zones = [
    "us-west-2a",
    "us-west-2b",
    "us-west-2c"
  ]
}

module "ecr" {
  source = "./modules/ecr"

  ecr_name     = "lesson-7-ecr"
  scan_on_push = true
}

module "eks" {

  source = "./modules/eks"

  cluster_name = "lesson7-cluster"

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.private_subnet_ids
}