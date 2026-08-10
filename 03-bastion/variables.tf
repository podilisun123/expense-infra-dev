variable "project_name" {
  type        = string
  default     = "expense"
}
variable "environment" {
  type        = string
  default     = "dev"
}
variable "instance_type" {
    type = string
    default = "t3.micro"
}
variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}