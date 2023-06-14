variable "cluster_identifier" {
    description = "The name of the cluster"
    type        = string
    default     = "da-mlop-rds-prod"
}

variable "engine" {
    description = "The name of the database engine to be used for this DB cluster"
    type        = string
    default     = "aurora-postgresql"
}

variable "engine_version" {
    description = "The database engine version"
    type        = string
    default     = "15.2"
}

variable "availability_zones" {
    description = "A list of EC2 Availability Zones that instances in the DB cluster can be created in"
    type        = list(string)
    default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "database_name" {
    description = "The name of the database to create when the DB instance is created"
    type        = string
    default     = "da_mlop_rds_prod"
}

variable "master_username" {
    description = "Username for the master DB user"
    type        = string
    default     = "da_mlop_rds_prod"
}

variable "master_password" {
    description = "Password for the master DB user"
    type        = string
    default     = "da_mlop_rds_prod"
}

variable "port" {
    description = "The port on which the DB accepts connections"
    type        = number
    default     = 5432
}

variable "db_parameter_group_name" {
    description = "The name of the DB parameter group to associate with this instance"
    type        = string
    default     = "da-mlop-rds-prod-postgre-param"
}

variable "db_cluster_parameter_group_name" {
    description = "The name of the DB cluster parameter group to associate with this cluster"
    type        = string
    default     = "da-mlop-rds-prod-postgre-param"
}

variable "db_subnet_group_name" {
    description = "The DB subnet group to associate with this DB instance"
    type        = string
    default     = "da-mlop-rds-prod-postgre-param"
}

variable "vpc_security_group_ids" {
    description = "A list of EC2 VPC security groups to associate with this DB cluster"
    type        = list(string)
    default     = []
}

# variable "db_cluster_identifier" {
#     description = "The DB cluster identifier"
#     type        = string
#     default     = []
# }

# variable "db_cluster_identifier_prefix" {
#     description = "Creates a unique identifier beginning with the specified prefix"
#     type        = string
#     default     = []
# }

# variable "preferred_backup_window" {
#     description = "The daily time range during which automated backups are created"
#     type        = string
#     default     = []
# }

variable "name" {
    description = "The name of the DB cluster"
    type        = string
    default     = "da-mlop-rds-prod-postgre"
}

# variable "backup_retention_period" {
#     description = "The days to retain backups for"
#     type        = number
#     default     = []
# }

variable "family" {
    description = "The family of the DB cluster parameter group"
    type        = string
    default     = "aurora-postgresql15"
}
  
variable "tags" {
    description = "A mapping of tags to assign to the resource"
    type        = map(string)
    default     = {
        "Name" = "da-mlop-rds-prod-postgre"
        "Terrform" = "true"
        "Owner" = "SRPH"
    }
}

variable "skip_final_snapshot" {
    description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
    type        = bool
    default     = true
}

variable "final_snapshot_identifier" {
    description = "The name of your final DB snapshot when this DB cluster is deleted"
    type        = string
    default     = "da-mlop-rds-prod-postgre-final"
}

# variable "count" {
#     description = "The number of DB instances to create"
#     type        = number
#     default     = 1
# }

variable "identifier" {
    description = "The identifier of the DB instance"
    type        = string
    default     = "da-mlop-rds-prod-postgre"
}

variable "instance_class" {
    description = "The instance type of the DB instance"
    type        = string
    default     = "db.r5.large"
}
