# Elastic IP module
module "AS2_eip" {
  source = "./modules/eip"
  vpc_id = module.AS2_VPC.vpc_id
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

   network_interface {
    associate_with_eip = module.AS2_eip.eip_id
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# output "bastion_ip_address" {
# value = module.AS2_bastion_instance.public_ip
# }

output "eip_id" {
  value = module.AS2_eip.eip_id
  description = "Assigned eip id"
}