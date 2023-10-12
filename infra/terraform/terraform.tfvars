
region       = "us-east-1"
username     = "aravind15b"
password     = "enter the gitub token encryted form"
taskrole     = "ecsTaskExecutionrole"
policy       = "ECS-SecretsManager-Permission"
policyarn    = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
kms-alias    = "alias/infra333"
secrets-name = "infra-333"


vpssubnet      = ["subnet-09779fba763d5bc05", "subnet-06669cd66a6d9ca7d", "subnet-024a70f10b6242a20", "subnet-08d125d25c9fa928c", "subnet-09dc3324d7b38717c", "subnet-01a7f71c061f251a0"]
vpcid          = "vpc-05272d0eb803587ed"
security-group = ["sg-090be45d724982a83", "sg-062b4a2a6f53370cc"]
