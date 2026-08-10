resource "aws_key_pair" "vpn" {
  key_name   = "vpn"
  # you can paste the public key directly like this
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFg14Oizniz9jjRZGvl+W6V+1DPXkICtvTQOnJ4yRaxh admin@DESKTOP-FEBJA6R"
  #public_key = file("~/.ssh/new-key.pub")
  # ~ means windows home directory
}

module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  key_name = aws_key_pair.vpn.key_name
  name = "${var.project_name}-${var.environment}-vpn"

  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  # convert StringList to list and get first element
  subnet_id = local.public_subnet_id
  ami = data.aws_ami.ami_info.id
  
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-vpn"
    }
  )
}