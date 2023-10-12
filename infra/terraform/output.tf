output "kms_key_arn" {
  value = module.IAm.kms_key_arn
}

output "khs_key_alias" {
  value = module.IAm.khs_key_alias
}
output "secret_manager_arn" {
  value = module.IAm.secret_manager_arn
}
