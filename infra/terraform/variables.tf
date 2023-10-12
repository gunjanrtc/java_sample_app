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
  type    = list(string)
  default = ["1", "2"]
}
