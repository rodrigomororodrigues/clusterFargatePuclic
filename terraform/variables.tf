#Variables
variable "infrastructure_version" {
  default = "1"
}
variable "access_key" {
  default = "Key"
}
variable "secret_key" {
  default = "Key"
}
variable "region" {
  default = "us-east-2"
}
variable "vpc_cidr" {
  description = "The CIDR Block for the SiteSeer VPC"
  default     = "10.0.0.0/16"
}

variable "rt_wide_route" {
  description = "Route in the SiteSeer Route Table"
  default     = "0.0.0.0/0"
}
variable "subnet_count" {
  description = "no of subnets"
  default = 2
}
variable "availability_zones" {
  description = "availability zone to create subnet"
  default = [
    "us-east-2a",
    "us-east-2b"]
}
variable "postgres_db_port" {
  description = "Port exposed by the RDS instance"
  default = 5432
}
variable "rds_instance_type" {
  description = "Instance type for the RDS database"
  default = "db.t2.micro"
}
# Change database-1 to postgres
variable "rds_identifier" {
  description = "db identifier"
  default     = "toptalpostgres"
}
variable "rds_storage_type" {
  description = "db storage type"
  default     = "gp2"
}
# Change 20 to 5
variable "rds_allocated_storage" {
  description = "db allocated storage"
  default     = 20
}
variable "rds_engine" {
  description = "type of db engine"
  default     = "postgres"
}
variable "rds_engine_version" {
  description = "db engine version"
  default     = "12"
}
variable "rds_database_name" {
  description = "db worker name"
  default     = "postgresdb"
}
variable "rds_username" {
  description = "db username toptal"
  default     = "toptaluser"
}
variable "rds_password" {
  description = "db password"
  default     = "admin123"
}
variable "rds_final_snapshot_identifier" {
  description = "db final snapshot identifier"
  default     = "worker-final"
}
variable "toptal_app_port" {
  description = "Port exposed by the node application"
  default = 3001
}

variable "toptal_app_web_port" {
  description = "Port exposed by the node application"
  default = 80
}
variable "toptal_app_image" {
  description = "Dockerhub image for toptal-api"
  default = "docker.io/****/191819532958.dkr.ecr.us-east-1.amazonaws.com/api:latest"
}

# revisar image --web--
variable "toptal_app_web_image" {
  description = "Dockerhub image for toptal-web"
  default = "docker.io/****/191819532958.dkr.ecr.us-east-1.amazonaws.com/web:latest"
}
variable "toptal_app" {
  description = "Toptal APP variable"
  default = "api"
}
# variable --web--
variable "toptal_web_app" {
  description = "Toptal APP variable"
  default = "web"
}
variable "toptal_env" {
  description = "Node ENV variable"
  default = "dev"
}

#var --web--
variable "toptal_web_env" {
  description = "Node ENV variable"
  default = "dev"
}
variable "toptal_app_home" {
  description = "APP HOME variable"
  default = "/opt/app/"
}

# home --web--
variable "toptal_app_web_home" {
  description = "APP HOME variable"
  default = "/opt/app/"
}
variable "ecs_task_definition_name" {
  description = "Deployment Application Toptal to Ecs Cluster API"
  type = string
  default = "toptal-app"
}

variable "ecs_task_definition_name_web" {
  description = "Deployment Application Toptal to Ecs Cluster" # new variable web-app
  type = string
  default = "toptal-app-web"
}

variable "cloudwatch_group" {
  description = "CloudWatch App Toptal App"
  type = string
  default = "toptal-app-api"  
} 

variable "cloudwatch_web_group" {
  description = "CloudWatch App Toptal App"
  type = string
  default = "toptal-web-app"  
} 


variable "CLOUDWATCH_WEB_GROUP" {
  description = "CloudWatch App Toptal App"
  type = string
  default = "toptal-web-app"  
} 
variable "health_check_path" {
  description = "Http path for task health check"
  default     = "/status"
}

