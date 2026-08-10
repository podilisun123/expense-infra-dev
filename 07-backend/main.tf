module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.project_name}-${var.environment}-${var.common_tags.Component}"

  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_ssm_parameter.backend_sg_id.value]
  # convert StringList to list and get first element
  subnet_id = local.private_subnet_id
  ami = data.aws_ami.ami_info.id
  
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-${var.common_tags.Component}"
    }
  )
}
resource "null_resource" "cluster" {
  triggers = {
    instance_id = module.backend.id
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = module.backend.private_ip
  }
  provisioner "file" {
        source      = "${var.common_tags.Component}.sh"
        destination = "/tmp/${var.common_tags.Component}.sh"
  }
  provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/${var.common_tags.Component}.sh",
            "sudo sh /tmp/${var.common_tags.Component}.sh ${var.common_tags.Component} ${var.environment}"
        ]
    } 
}