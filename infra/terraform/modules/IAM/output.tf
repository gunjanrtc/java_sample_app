output "kms_key_arn" {
  value = aws_kms_key.terraformgithubkey3.arn
}

output "khs_key_alias" {
  value = aws_kms_alias.terragalias3.name
}
output "secret_manager_arn" {
  value = aws_secretsmanager_secret.terg3.arn
}
output "iam_role" {
  value = aws_iam_role.ecs_taskExecution_role.arn
}
