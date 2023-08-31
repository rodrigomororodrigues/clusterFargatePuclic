# create the ECS cluster
resource "aws_ecs_cluster" "fp-ecs-cluster" {
  name = "morofargate-app"

  tags = {
    Name = "morofargate-app"
  }
}