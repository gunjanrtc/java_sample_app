data "aws_ecs_cluster" "acs_cluster" {
  cluster_name = "test-default"
}
data "aws_lb_target_group" "test" {
  name = "tomcat-default"
}
data "aws_iam_role" "example" {
  name = "ecsTaskExecutionrole-default"
}
data "aws_secretsmanager_secret" "by-name" {
  name = "infra_repo6-default"
}

locals {
  container_definitions_file = "./TaskDefinition/service.json"
  container_definitions      = file(local.container_definitions_file)
  updated_container_definitions = replace(local.container_definitions, "var.secret_arn", "${data.aws_secretsmanager_secret.by-name.arn}")
}

# Update the secret ARN in the local container_definitions
# locals {
#   updated_container_definitions = replace(local.container_definitions, "var.secret_arn", "${data.aws_secretsmanager_secret.by-name.arn}")
# }


module "ECSService" {
  source         = "github.com/Ritik0306/my-first-tf-repo//infra/terraform/Modules/ECSService"
  vpssubnet      = var.vpssubnet
  security-group = var.security-group
  task_arn       = module.TaskDefiniton.task_arn
  cluster_id     = data.aws_ecs_cluster.acs_cluster.id
  alb_target_arn = data.aws_lb_target_group.test.arn
  service_name   = "${var.service_name}_${terraform.workspace}"
  desired_count  = var.desired_count
  launch_type    = var.launch_type
  container_name = var.container_name
  container_port = var.container_port
}
module "TaskDefiniton" {
  source                     = "github.com/Ritik0306/my-first-tf-repo//infra/terraform/Modules/TaskDefinition"
  iam_role_arn               = data.aws_iam_role.example.arn
  ecs_task_definition_family = var.ecs_task_definition_family
  ecs_network_mode           = var.ecs_network_mode
  cpu                        = var.cpu
  memory                     = var.memory
  container_definitions      = local.updated_container_definitions
}