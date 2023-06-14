module "aurora_rds" {
    # create moduel aurora-postgresql

    source = "./modules/aurora-postgresql"

    name = "da-mlops-prod-db"

    cluster_identifier = var.cluster_identifier
    engine             = var.engine
    engine_version     = var.engine_version
    availability_zones = var.availability_zones
    database_name      = var.database_name
    master_username    = var.master_username
    master_password    = var.master_password
    port               = var.port

    db_parameter_group_name      = var.db_parameter_group_name
    db_cluster_parameter_group_name = var.db_cluster_parameter_group_name

    vpc_security_group_ids = [aws_security_group.da-mlops-prod-db-sg.id]
    db_subnet_group_name   = var.db_subnet_group_name
    tags                   = var.tags

}
resource "aws_security_group" "da-mlops-prod-db-sg" {
  name        = "aurora-sg"
  description = "Security group for Aurora"
  vpc_id      = "vpc-087212b62a232fa23"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aurora-sg"
  }
}




