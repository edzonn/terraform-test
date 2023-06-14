# Provider Block
provider "aws" {
  region = local.region
}

locals {
  name             = "da-mlops-prod-vpc"
  region           = "ap-southeast-1"

  tags = {
    Name      = local.name
    Terraform = "true"
    Owner     = "SRPH"
  }
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "./modules/vpc"

  name = local.name
  cidr = "10.142.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = ["10.142.144.0/24", "10.142.145.0/24", "10.142.146.0/24"]
  public_subnets  = ["10.142.141.0/24", "10.142.142.0/24", "10.142.143.0/24"]
  database_subnets = ["10.142.138.0/24", "10.142.139.0/24", "10.142.140.0/24"]

  create_database_subnet_group = true
  database_subnet_group_name = "da-mlop-rds-prod-subnet"

  # create parameter
  create_db_cluster_parameter_group = true
  db_cluster_parameter_group_name = "da-mlop-rds-prod-cluster-param"

  enable_ipv6 = false

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "da-ml-ops-prod-public"
  }

  public_subnet_tags_per_az = {
    "${local.region}a" = {
      "availability-zone" = "${local.region}a"
    }
  }

  private_subnet_tags = {
    Name = "da-ml-ops-prod-private"
  }

  private_subnet_tags_per_az = {
    "${local.region}a" = {
      "availability-zone" = "${local.region}a"
    }
  }

  tags = local.tags

  vpc_tags = {
    Name = local.name
  }
}