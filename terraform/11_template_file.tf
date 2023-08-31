data "template_file" "task_definition_template" {
  template = file("task_definition.json.tpl")
  vars = {
    REPOSITORY_URL = var.morofargate_app_image
    POSTGRES_USERNAME = aws_db_instance.rds_instance.username
    POSTGRES_PASSWD = aws_db_instance.rds_instance.password
    POSTGRES_ENDPOINT = aws_db_instance.rds_instance.endpoint
    POSTGRES_DATABASE = aws_db_instance.rds_instance.db_name  
    morofargate_app = var.morofargate_app
    morofargate_env = var.morofargate_env
    morofargate_app_HOME = var.morofargate_app_home
    morofargate_app_PORT = var.morofargate_app_port
    APP_SECRET_KEY = replace(random_string.morofargate-secret-key.result,"\"","") 
    REGION = var.region
    CLOUDWATCH_GROUP = aws_cloudwatch_log_group.awslogs.name

  }
}


data "template_file" "task_definition_template2" { 
  template = file("task_definition2.json.tpl") 
  vars = { 
    REPOSITORY_URL = var.morofargate_app_web_image
    morofargate_app = var.morofargate_web_app
    morofargate_env = var.morofargate_env
    morofargate_app_HOME = var.morofargate_app_web_home
    morofargate_app_PORT = var.morofargate_app_web_port
    #APP_SECRET_KEY = replace(random_string.morofargate-secret-key.result,"\"","") 
    REGION = var.region
    CLOUDWATCH_WEB_GROUP = aws_cloudwatch_log_group.awslogsweb.name 
  }
}   
