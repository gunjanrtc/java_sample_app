variable "region" {
  type    = string
  default = ""
}
variable "vpssubnet" {
  type    = list(string)
  default = ["1", "2", "3", "4", "5", "6"]
}
variable "iam_role_arn" {
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
variable "cluster_id" {
  type = string
  default = ""
}
variable "target_group_arn" {
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
variable "secret_manarger_arn" {
  type = string
  default = ""
}