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
  default     = "morofargatepostgres"
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
  description = "db username morofargate"
  default     = "morofargateuser"
}
variable "rds_password" {
  description = "db password"
  default     = "admin123"
}
variable "rds_final_snapshot_identifier" {
  description = "db final snapshot identifier"
  default     = "worker-final"
}
variable "morofargate_app_port" {
  description = "Port exposed by the node application"
  default = 3001
}

variable "morofargate_app_web_port" {
  description = "Port exposed by the node application"
  default = 80
}
variable "morofargate_app_image" {
  description = "Dockerhub image for morofargate-api"
  default = "docker.io/****/191819532958.dkr.ecr.us-east-1.amazonaws.com/api:latest"
}

# revisar image --web--
variable "morofargate_app_web_image" {
  description = "Dockerhub image for morofargate-web"
  default = "docker.io/****/191819532958.dkr.ecr.us-east-1.amazonaws.com/web:latest"
}
variable "morofargate_app" {
  description = "morofargate APP variable"
  default = "api"
}
# variable --web--
variable "morofargate_web_app" {
  description = "morofargate APP variable"
  default = "web"
}
variable "morofargate_env" {
  description = "Node ENV variable"
  default = "dev"
}

#var --web--
variable "morofargate_web_env" {
  description = "Node ENV variable"
  default = "dev"
}
variable "morofargate_app_home" {
  description = "APP HOME variable"
  default = "/opt/app/"
}

# home --web--
variable "morofargate_app_web_home" {
  description = "APP HOME variable"
  default = "/opt/app/"
}
variable "ecs_task_definition_name" {
  description = "Deployment Application morofargate to Ecs Cluster API"
  type = string
  default = "morofargate-app"
}

variable "ecs_task_definition_name_web" {
  description = "Deployment Application morofargate to Ecs Cluster" # new variable web-app
  type = string
  default = "morofargate-app-web"
}

variable "cloudwatch_group" {
  description = "CloudWatch App morofargate App"
  type = string
  default = "morofargate-app-api"  
} 

variable "cloudwatch_web_group" {
  description = "CloudWatch App morofargate App"
  type = string
  default = "morofargate-web-app"  
} 


variable "CLOUDWATCH_WEB_GROUP" {
  description = "CloudWatch App morofargate App"
  type = string
  default = "morofargate-web-app"  
} 
variable "health_check_path" {
  description = "Http path for task health check"
  default     = "/status"
}

