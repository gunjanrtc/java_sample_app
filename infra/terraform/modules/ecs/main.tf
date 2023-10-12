data "aws_ecs_cluster" "Java_Poc" {
  cluster_name = "Java_Poc-${terraform.workspace}"
}
locals {
  container_definitions_file = "${path.module}/task-definitions/service.json"
  container_definitions      = file(local.container_definitions_file)
}

# Update the secret ARN in the local container_definitions
locals {
  updated_container_definitions = replace(local.container_definitions, "var.secret_arn", "${var.secret_arn}")
}
resource "aws_ecs_task_definition" "Java-Poc" {
  family                   = "Java-Poc"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "3072"
  execution_role_arn       = var.iam_role_arn
  container_definitions    = local.updated_container_definitions
}
resource "aws_alb_target_group" "ter_tg" {
  vpc_id      = var.vpcid
  name        = "tomcat"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  health_check {
    path = "/demo/"
    port = "8080"
  }
}
resource "aws_alb" "ter_demoalb_g" {
  name            = "demoalbg"
  subnets         = [var.vpssubnet[0], var.vpssubnet[1], var.vpssubnet[2], var.vpssubnet[3], var.vpssubnet[4], var.vpssubnet[5]]
  security_groups = [var.security-group[0], var.security-group[1]]
  internal        = false
  tags = {
    name = "demoalbg-${terraform.workspace}"
  }


}
# Create a listener for the ALB on port 80
resource "aws_alb_listener" "tera_listener" {
  load_balancer_arn = aws_alb.ter_demoalb_g.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.ter_tg.id
    type             = "forward"
  }
}
resource "aws_ecs_service" "Qa-Java-Poc-3" {
  name            = "Java-Poc-3"
  cluster         = aws_ecs_cluster.Java_Poc.id
  task_definition = aws_ecs_task_definition.Java-Poc.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [var.vpssubnet[0], var.vpssubnet[1], var.vpssubnet[2], var.vpssubnet[3], var.vpssubnet[4], var.vpssubnet[5]]
    security_groups  = [var.security-group[0], var.security-group[1]]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_alb_target_group.ter_tg.arn
    container_port   = 8080
    container_name   = "ghcr"

  }
  tags = {
    name = "Java-Poc-3-${terraform.workspace}"
  }
}
