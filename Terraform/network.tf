
# This is VPC module 
# In this Vpc, public,private subnets , NAT and IGW is created 
# The route tables are also created for both Public and private subnet

module "AS2_VPC" {
  source = "terraform-aws-modules/vpc/aws"

  name = "AS2_VPC"
  cidr = "10.0.0.0/16"

  private_subnets = [data.aws_subnet.AS2_private_subnet_a.cidr_block,data.aws_subnet.AS2_private_subnet_b.cidr_block]
  public_subnets  = [data.aws_subnet.AS2_public_subnet_a.cidr_block,data.aws_subnet.AS2_public_subnet_b.cidr_block]
  azs             = ["us-east-1a","us-east-1b"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    name= "AS2_VPC"
    Terraform = "true"
    Environment = "dev"
  }
 output "vpc_id" {
  value = module.AS2_VPC.vpc_id
}

}
