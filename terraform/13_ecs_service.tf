resource "aws_ecs_service" "morofargate-service" {
  name = "morofargate-app-service"
  cluster = aws_ecs_cluster.fp-ecs-cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count = 2
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent = 200
  launch_type = "FARGATE"
  scheduling_strategy = "REPLICA"
  enable_ecs_managed_tags = true


  network_configuration {
    security_groups = [
      aws_security_group.ecs_sg.id]
    subnets = aws_subnet.public_subnets.*.id
    # subnets = aws_subnet.private_subnets.*.id
    assign_public_ip = true
    # assign_public_ip = false
  }

  load_balancer {
    container_name = "morofargate-app-api"
    container_port = var.morofargate_app_port
    target_group_arn = aws_alb_target_group.target_group.id
  }

  depends_on = [
    aws_alb_listener.fp-alb-listener
  ]

  lifecycle {
    ignore_changes = [
      task_definition, desired_count]
  }
}

resource "aws_ecs_service" "morofargate-service-web" {
  name = "morofargate-app-service-web"
  cluster = aws_ecs_cluster.fp-ecs-cluster.id
  task_definition = aws_ecs_task_definition.task_definition2.arn 
  desired_count = 2
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent = 200
  launch_type = "FARGATE"
  scheduling_strategy = "REPLICA"
  enable_ecs_managed_tags = true


  network_configuration {
    security_groups = [
      aws_security_group.ecs_sg.id]
    subnets = aws_subnet.public_subnets.*.id
    # subnets = aws_subnet.private_subnets.*.id
    assign_public_ip = true
    # assign_public_ip = false
  }

  load_balancer {
    container_name = "morofargate-app-web"
    container_port = var.morofargate_app_web_port
    target_group_arn = aws_alb_target_group.target_group.id
  }

  depends_on = [
    aws_alb_listener.fp-alb-listener
  ]

  lifecycle {
    ignore_changes = [
      task_definition, desired_count]
  }
}