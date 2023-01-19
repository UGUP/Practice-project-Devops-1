# This is VPC module 
# In this Vpc, public,private subnets , NAT and IGW is created 
# The route tables are also created for both Public and private subnet

module "AS2-VPC" {
  source = "terraform-aws-modules/vpc/aws"

  name = "AS2-VPC"
  cidr = "10.0.0.0/16"

 # Here I am importing resources from networkresource.tf to created public and private 
 # subnets as per the availability zones
  private_subnets = [aws_subnet.private_subnet_a.id,aws_subnet.private_subnet_b.id]
  public_subnets  = [aws_subnet.public_subnet_a.id,aws_subnet.public_subnet_b.id]
  azs             = ["us-east-1a","us-east-1b"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    name= "AS2-VPC"
    Terraform = "true"
    Environment = "dev"
  }
}