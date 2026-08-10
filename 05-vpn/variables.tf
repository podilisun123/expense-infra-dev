variable "project_name" {
    default = "expense"
}
variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
        Component = "vpn"
    }
}
variable "instance_type" {
    default = "t3.micro"
    type = string
}
