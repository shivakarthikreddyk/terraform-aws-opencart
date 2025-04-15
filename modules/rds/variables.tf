// modules/rds/variables.tf
variable "security_group_id" {}
variable "subnet_ids" {
  type = list(string)
}
