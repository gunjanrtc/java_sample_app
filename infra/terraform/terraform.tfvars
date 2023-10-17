vpssubnet      = ["subnet-00d1557ec21898171", "subnet-0816b5a78e3d2806b", "subnet-09b88e0cf3851d052", "subnet-05f70bfa08b1a0af2", "subnet-04a32143ba94858e9", "subnet-0d2b9ceb895c13010"]
vpcid          = "vpc-027173b67218cb074"
security_group_id = ["sg-0bdbd2a1c33504aec"]
region         = "us-east-1"

service_name   = "acs_poc"
launch_type    = "FARGATE"
desired_count  = "1"
container_port = "8080"
container_name = "ghcr"
cluster_name = "test_qa"
target_group_name = "acstargetgroupqa"
iam_role_name = "kms_role"
secret_name = "acs_infra"


ecs_task_definition_family = "acs_poc"
ecs_network_mode           = "awsvpc"
cpu                        = 1024
memory                     = 3072
