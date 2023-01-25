module "AS2_bastion_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "AS2_bastion_instance"

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [module.AS2_bastion_sg.security_group_id]
  subnet_id              = module.AS2_VPC.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "bastion_ip_address" {
value = module.AS2_bastion_instance.public_ip
}