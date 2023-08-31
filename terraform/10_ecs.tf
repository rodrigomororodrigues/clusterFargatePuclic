# create the ECS cluster
resource "aws_ecs_cluster" "fp-ecs-cluster" {
  name = "toptal-app"

  tags = {
    Name = "toptal-app"
  }
}