# Elastic IP resource
resource "aws_eip" "AS2_eip" {
  #instance = module.AS2_bastion_instance.id
  vpc      = true
}

# EC2 cbastion instance creation 
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

   network_interface = [
    {
    associate_with_eip = aws_eip.AS2_eip.id
    }
   ]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "bastion_ip_address" {
value = module.AS2_bastion_instance.public_ip
description = "The public ip of ec2 instance"
}

output "eip_id" {
  value = aws_eip.AS2_eip.id
  description = "generated eip id"
}