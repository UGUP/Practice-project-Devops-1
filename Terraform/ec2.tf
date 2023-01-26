
# EC2 bastion instance creation 
module "AS2_bastion_instance" {
  depends_on = [
     null_resource.create_key_pair
  ]
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

resource "null_resource" "create_key_pair" {
  provisioner "local-exec" {
    command = "ssh-keygen -t rsa -b 4096  -f AS2key -N ''"
  }
}

resource "aws_key_pair" "example" {
   depends_on = [
     null_resource.create_key_pair
   ]
  key_name   = var.key_name
  public_key = "${file("AS2key.pub")}" 
}

output "bastion_ip_address" {
value = module.AS2_bastion_instance.public_ip
description = "The public ip of ec2 instance"
}

