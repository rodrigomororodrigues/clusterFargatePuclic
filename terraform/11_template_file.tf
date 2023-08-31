data "template_file" "task_definition_template" {
  template = file("task_definition.json.tpl")
  vars = {
    REPOSITORY_URL = var.toptal_app_image
    POSTGRES_USERNAME = aws_db_instance.rds_instance.username
    POSTGRES_PASSWD = aws_db_instance.rds_instance.password
    POSTGRES_ENDPOINT = aws_db_instance.rds_instance.endpoint
    POSTGRES_DATABASE = aws_db_instance.rds_instance.db_name  
    TOPTAL_app = var.toptal_app
    TOPTAL_env = var.toptal_env
    TOPTAL_app_HOME = var.toptal_app_home
    TOPTAL_app_PORT = var.toptal_app_port
    APP_SECRET_KEY = replace(random_string.toptal-secret-key.result,"\"","") 
    REGION = var.region
    CLOUDWATCH_GROUP = aws_cloudwatch_log_group.awslogs.name

  }
}


data "template_file" "task_definition_template2" { 
  template = file("task_definition2.json.tpl") 
  vars = { 
    REPOSITORY_URL = var.toptal_app_web_image
    TOPTAL_app = var.toptal_web_app
    TOPTAL_env = var.toptal_env
    TOPTAL_app_HOME = var.toptal_app_web_home
    TOPTAL_app_PORT = var.toptal_app_web_port
    #APP_SECRET_KEY = replace(random_string.toptal-secret-key.result,"\"","") 
    REGION = var.region
    CLOUDWATCH_WEB_GROUP = aws_cloudwatch_log_group.awslogsweb.name 
  }
}   
