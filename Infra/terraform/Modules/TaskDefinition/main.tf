locals {
  container_definitions_file = "${path.module}/task-definitions/service.json"
  container_definitions      = file(local.container_definitions_file)
}

# Update the secret ARN in the local container_definitions
locals {
  updated_container_definitions = replace(local.container_definitions, "var.secret_arn", "${var.secret_arn}")
}
resource "aws_ecs_task_definition" "acs_task_definition" {
  family                   = var.ecs_task_definition_family
  network_mode             = var.ecs_network_mode
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.iam_role_arn
  container_definitions    = local.updated_container_definitions
}
