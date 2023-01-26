resource "null_resource" "get_ip_address" {
  provisioner "local-exec" {
    command = "my_ip=$(curl ifconfig.me); echo $my_ip > ipaddress.txt"
  }
}

output "ip_address" {
  value = "${trimspace(regex(replace(output.provisoner_output, "EOT", ""), "\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}"))}"
}


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
      #cidr_blocks = "${trimspace(regex(output.provisoner_output,"my_ip=(.*)"))}/32"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules = ["all-all"]
}
