
module "AS2_bastion_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "AS2_bastion_sg"
  description = "Security group for bastion instance"
  vpc_id      = module.AS2_VPC.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks= "${var.my_ip}/${var.bits}"
    }
  ]
  egress_rules = [ "all-all"]

  
}




module "AS2_privateinstance_sg"{
    source = "terraform-aws-modules/security-group/aws"

  name        = "AS2_privateinstance_sg"
  description = "Security group for private instances"
  vpc_id      = module.AS2_VPC.vpc_id

 ingress_with_cidr_blocks = [ {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.VPC
  }
 ]
   egress_rules = [ "all-all"]

}


# # module "AS2_publicweb_sg"{
# #     source = "terraform-aws-modules/security-group/aws"

# #   name        = "AS2_publicweb_sg"
# #   description = "Security group for public web"
# #   vpc_id      = module.AS2_VPC.vpc_id

# #   ingress_cidr_blocks      = ["10.10.0.0/16"]
# #   ingress_rules            = ["https-443-tcp"]
# #   ingress_with_cidr_blocks = [
# #     {
# #       from_port   = 8080
# #       to_port     = 8090
# #       protocol    = "tcp"
# #       description = "User-service ports"
# #       cidr_blocks = "10.10.0.0/16"
# #     },
# #     {
# #       rule        = "postgresql-tcp"
# #       cidr_blocks = "0.0.0.0/0"
# #     },
# #   ]

# # }
