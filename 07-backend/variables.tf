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
        Component = "backend"
    }
}
variable "instance_type" {
    default = "t3.micro"
}
variable "zone_name"{
    default = "jnpndevops.online"
}
