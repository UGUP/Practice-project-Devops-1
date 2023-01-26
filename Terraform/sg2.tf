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
      cidr_blocks = "${trimspace(regex(null_resource.get_ip_address.command,"my_ip=(.*)"))}/32"
    }
  ]
  egress_rules = [ "all-all"]
}

resource null_resource "get_ip_address" {
 provisioner "local-exec" {
    command = "my_ip=$(curl ifconfig.me); echo my_ip=$my_ip"
  }
 }
 
 output "provisoner_output" {
    value =  null_resource.get_ip_address.command
  }
