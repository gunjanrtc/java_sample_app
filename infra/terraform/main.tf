module "IAm" {
  source = "./modules/IAM/"

  username     = var.username
  password     = var.password
  policy       = var.policy
  policyarn    = var.policyarn
  kms-alias    = var.kms-alias
  secrets-name = var.secrets-name
  taskrole     = var.taskrole

}
module "ecs" {
  source         = "./modules/ecs"
  vpcid          = var.vpcid
  vpssubnet      = var.vpssubnet
  security-group = var.security-group
  iam_role_arn   = module.IAm.iam_role
  secret_arn     = module.IAm.secret_manager_arn
}
