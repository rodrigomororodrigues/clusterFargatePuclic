variable "logs_retention_in_days" {
  type        = number
  default     = 90
  description = "Specifies the number of days you want to retain log events"
}

resource "aws_cloudwatch_log_group" "awslogs" {
  # name = "morofargate-app"
  name              = "/fargate/service/${var.cloudwatch_group}"
  retention_in_days = var.logs_retention_in_days
  tags = {
    Environment = "dev"
    Application = var.cloudwatch_group
  }
}

resource "aws_cloudwatch_log_group" "awslogsweb" {
  # name = "morofargate-app"
  name              = "/fargate/service/${var.cloudwatch_web_group}"
  retention_in_days = var.logs_retention_in_days
  tags = {
    Environment = "dev"
    Application = var.cloudwatch_web_group
  }
}