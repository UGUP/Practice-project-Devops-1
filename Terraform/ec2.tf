
# EC2 bastion instance creation 
module "AS2_bastion_instance" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = "AS2_bastion_instance"
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               =  aws_key_pair.key_pair.key_name
  monitoring             = true
  vpc_security_group_ids = [module.AS2_bastion_sg.security_group_id]
  subnet_id              = module.AS2_VPC.public_subnets[0]
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}


# EC2 Jenkins instance creation 
module "AS2_Jenkins_instance" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = "AS2_Jenkins_instance"
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               =  aws_key_pair.key_pair.key_name
  monitoring             = true
  vpc_security_group_ids = [module.AS2_privateinstance_sg.security_group_id]
  subnet_id              = module.AS2_VPC.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}


# EC2 Jenkins instance creation 
module "AS2_App_instance" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "AS2_app_instance"

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               =  aws_key_pair.key_pair.key_name
  monitoring             = true
  vpc_security_group_ids = [module.AS2_privateinstance_sg.security_group_id]
  subnet_id              = module.AS2_VPC.private_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}



resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = var.public_key
}








output "bastion_ip_address" {
value = module.AS2_bastion_instance.public_ip
description = "The public ip of bastion ec2 instance"
}


output "jenkins_private_ip_address" {
value = module.AS2_Jenkins_instance.private_ip
description = "The private ip of jenkins ec2 instance"
}

output "app_private_ip_address" {
value = module.AS2_App_instance.private_ip
description = "The private ip of app ec2 instance"
}

