resource "aws_kms_key" "terraformgithubkey3" {
  description = "terraform github key creation"
}
resource "aws_kms_alias" "terragalias3" {
  name          = var.kms-alias
  target_key_id = aws_kms_key.terraformgithubkey3.id
}
resource "aws_secretsmanager_secret" "terg3" {
  name                           = var.secrets-name
  kms_key_id                     = aws_kms_key.terraformgithubkey3.id
  force_overwrite_replica_secret = true
}
resource "aws_secretsmanager_secret_version" "terg_version3" {
  secret_id = aws_secretsmanager_secret.terg3.id

  secret_string = jsonencode(
    {
      "username" : "${var.username}",

      "password" : "${var.password}",
  })
}
resource "aws_iam_role" "ecs_taskExecution_role" {
  name = var.taskrole
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_policy_attachment" "ecs_aws_task_excution_attachment" {
  name       = var.taskrole
  roles      = [aws_iam_role.ecs_taskExecution_role.name]
  policy_arn = var.policyarn
}
resource "aws_iam_policy" "ecs_kms_decrypt" {
  name = var.policy
  policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "kms:Decrypt",
          "secretsmanager:GetSecretValue"
        ],
        "Resource" : [
          "${aws_secretsmanager_secret.terg3.arn}",
          "${aws_kms_key.terraformgithubkey3.arn}"
        ]
      }
    ]

  })
}
resource "aws_iam_role_policy_attachment" "ecs_kms_decrypt_attachment" {
  policy_arn = aws_iam_policy.ecs_kms_decrypt.arn
  role       = aws_iam_role.ecs_taskExecution_role.name
}
