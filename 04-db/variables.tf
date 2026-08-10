variable "project_name" {
  type        = string
  default     = "expense"
}
variable "environment" {
  type        = string
  default     = "dev"
}
variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
        Component = "DB"
    }
}
variable "zone_name" {
  default = "jnpndevops.online"
}