resource "null_resource" "get_ip_address" {
  provisioner "local-exec" {
    command = "echo 'my_ip=$(curl ifconfig.me)' > ip_address.txt"
  }
}

# output "provisoner_output" {
#   value = "${file("ip_address.txt")}"
# }

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
