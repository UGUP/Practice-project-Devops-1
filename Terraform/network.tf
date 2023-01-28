
# This is VPC module 
# In this Vpc, public,private subnets , NAT and IGW is created 
# The route tables are also created for both Public and private subnet

module "AS2_VPC" {
  source = "terraform-aws-modules/vpc/aws"

  name = "AS2_VPC"
  cidr = var.VPC

  private_subnets = [var.private-subnet1,var.private-subnet2]
  public_subnets  = [var.public-subnet1,var.public-subnet2]
  # Added single NAT gateway to create only 1 NAT gateway in AZ-1a as per the requirement
  single_nat_gateway= true
  azs             = ["us-east-1a","us-east-1b"]


  

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    name= "AS2_VPC"
    Terraform = "true"
    Environment = "dev"
  }
}


output "vpc_id" {
  value = module.AS2_VPC.vpc_id
}

