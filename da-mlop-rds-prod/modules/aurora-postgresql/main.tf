locals {
    name             = "da-mlops-prod-postgre"
    region           = "ap-southeast-1"
    
    tags = {
        Name      = local.name
        Terraform = "true"
        Owner     = "SRPH"
    }
}

resource "aws_rds_cluster_parameter_group" "da-mlops-prod-postgre-param" {
    name       = var.name
    family     = var.family
}

# resource "aws_db_parameter_group" "da-mlops-prod-postgre-param" {
#     name       = var.db_parameter_group_name
#     family     = var.family
# }

resource "aws_db_parameter_group" "da-mlops-prod-postgre-param" {
    name        = var.name
    family      = var.family
}

resource "aws_rds_cluster" "da-mlops-prod-postgre-param" {
    cluster_identifier           = var.cluster_identifier
    engine                       = var.engine
    engine_version               = var.engine_version
    availability_zones           = var.availability_zones
    database_name                = var.database_name
    master_username              = var.master_username
    master_password              = var.master_password
    port                         = var.port
    db_cluster_parameter_group_name = var.db_cluster_parameter_group_name
    # db_parameter_group_name      = var.db_parameter_group_name

    skip_final_snapshot          = var.skip_final_snapshot
    final_snapshot_identifier    = var.final_snapshot_identifier
    vpc_security_group_ids       = var.vpc_security_group_ids
    db_subnet_group_name         = var.db_subnet_group_name
    tags                         = var.tags
}

resource "aws_rds_cluster_instance" "da-mlops-prod-postgre-param" {
    # count                       = var.count
    identifier                  = var.identifier
    cluster_identifier          = aws_rds_cluster.da-mlops-prod-postgre-param.id
    instance_class              = var.instance_class
    engine                      = var.engine
    engine_version              = var.engine_version
    availability_zone           = var.availability_zones[0]
    db_parameter_group_name     = aws_db_parameter_group.da-mlops-prod-postgre-param.name
    db_subnet_group_name        = var.db_subnet_group_name
    tags                        = var.tags
}




