variable "vpssubnet" {
  type    = list(string)
  default = ["1", "2", "3", "4", "5", "6"]
}
variable "iam_role_arn" {
  type = string

}
variable "secret_arn" {
  type = string
}
variable "vpcid" {
  type    = string
  default = ""
}
variable "security-group" {
  type    = list(string)
  default = ["1", "2"]
}

