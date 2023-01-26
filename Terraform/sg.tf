
# module "AS2_bastion_sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "AS2_bastion_sg"
#   description = "Security group for bastion instance"
#   vpc_id      = module.AS2_VPC.vpc_id

#   ingress_with_cidr_blocks = [
#     {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       description = "ssh"
#       # cidr_blocks = ["${local_ip}/32"]
#       #cidr_blocks = "${module.AS2_bastion_instance.public_ip}/${var.bits}"
#      # self = true
#     #  cidr_blocks = local-exec.my_ip
#      #cidr_blocks   = "${module.AS2_bastion_instance.my_ip}/${var.bits}"
#   #    # cidr_blocks = "${var.my_ip}/${var.bits}"
#   #  cidr_blocks = "${null_resource.get_ip_address.provisioner.output}"
#  # cidr_blocks = "${trimspace(regex(null_resource.get_ip_address.provisioner.command,"my_ip=(.*)"))}/32"
#     cidr_blocks = "${trimspace(regex(local-exec.get_ip_address.output,"my_ip=(.*)"))}/32" 
#     }
#   ]
#   egress_rules = [ "all-all"]

  
# }

#  resource null_resource "get_ip_address" {
#  provisioner "local-exec" {
#     command = "my_ip=$(curl ifconfig.me); echo my_ip=$my_ip"
#   }
#  }
 

# output "provisoner_output" {
#   value =  local-exec.get_ip_address.output
# }


# # module "AS2_privateinstance_sg"{
# #     source = "terraform-aws-modules/security-group/aws"

# #   name        = "AS2_privateinstance_sg"
# #   description = "Security group for private instances"
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
