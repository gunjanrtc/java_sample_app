variable "region" {
  type    = string
  default = ""
}
variable "vpssubnet" {
  type    = list(string)
  default = ["1", "2", "3", "4", "5", "6"]
}
variable "username" {
  type    = string
  default = ""
}
variable "password" {
  type    = string
  default = ""
}
variable "policyarn" {
  type    = string
  default = ""
}
variable "taskrole" {
  type    = string
  default = ""
}
variable "policy" {
  type    = string
  default = ""
}
variable "kms-alias" {
  type    = string
  default = ""
}
variable "secrets-name" {
  type    = string
  default = ""
}
variable "vpcid" {
  type    = string
  default = ""
}
variable "security-group" {
  type = list(string)
}
variable "cluster" {
  default = ""
}
variable "target" {
  type    = string
  default = ""
}
variable "ecs_task_definition_family" {
  type = string
}
variable "ecs_network_mode" {
  type = string
}
variable "cpu" {
  type = string
}
variable "memory" {
  type = string
}
variable "service_name" {
  type = string
}
variable "desired_count" {
  type = string
}
variable "launch_type" {
  type = string
}
variable "container_name" {
  type = string
}
variable "container_port" {
  type = string
}
variable "secret_arn" {
  type = string
  default = ""
}
