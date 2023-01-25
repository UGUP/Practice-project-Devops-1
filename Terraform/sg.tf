module "AS2_bastion_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "AS2_bastion_sg"
  description = "Security group for bastion instance"
  vpc_id      = module.AS2_VPC.vpc_id

  ingress_cidr_blocks      = [var.VPC]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = ["${module.AS2_bastion_instance.instance_public_ip}/${var.bits}"] 
      #ingress_with_self = module.AS2_bastion_instance.bastion_ip_address
    }
  ]
  egress_rules = [ "all-all"]
  
}

# module "AS2_privateinstance_sg"{
#     source = "terraform-aws-modules/security-group/aws"

#   name        = "AS2_privateinstance_sg"
#   description = "Security group for private instances"
#   vpc_id      = module.AS2_VPC.vpc_id

#   ingress_cidr_blocks      = ["10.10.0.0/16"]
#   ingress_rules            = ["https-443-tcp"]
#   ingress_with_cidr_blocks = [
#     {
#       from_port   = 8080
#       to_port     = 8090
#       protocol    = "tcp"
#       description = "User-service ports"
#       cidr_blocks = "10.10.0.0/16"
#     },
#     {
#       rule        = "postgresql-tcp"
#       cidr_blocks = "0.0.0.0/0"
#     },
#   ]

# }


# module "AS2_publicweb_sg"{
#     source = "terraform-aws-modules/security-group/aws"

#   name        = "AS2_publicweb_sg"
#   description = "Security group for public web"
#   vpc_id      = module.AS2_VPC.vpc_id

#   ingress_cidr_blocks      = ["10.10.0.0/16"]
#   ingress_rules            = ["https-443-tcp"]
#   ingress_with_cidr_blocks = [
#     {
#       from_port   = 8080
#       to_port     = 8090
#       protocol    = "tcp"
#       description = "User-service ports"
#       cidr_blocks = "10.10.0.0/16"
#     },
#     {
#       rule        = "postgresql-tcp"
#       cidr_blocks = "0.0.0.0/0"
#     },
#   ]

# }
