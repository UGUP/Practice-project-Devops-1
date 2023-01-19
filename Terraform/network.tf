# Resources created as per the availabilty ozones
# Here 2 public and 2 private subnets are created in each Availability zone.

resource "aws_subnet" "AS2_private_subnet_a" {
  vpc_id            = module.AS2_VPC.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    name="AS2_private_subnet_a"
  }
}

resource "aws_subnet" "AS2_private_subnet_b" {
  vpc_id            = module.AS2_VPC.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
   tags = {
    name="AS2_private_subnet_b"
  }
}
resource "aws_subnet" "AS2_public_subnet_a" {
  vpc_id            = module.AS2_VPC.vpc_id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "us-east-1a"
   tags = {
    name="AS2_public_subnet_a"
  }
}
resource "aws_subnet" "AS2_public_subnet_b" {
  vpc_id            = module.AS2_VPC.vpc_id
  cidr_block        = "10.0.102.0/24"
  availability_zone = "us-east-1b"
  tags = {
    name="AS2_public_subnet_b"
  }
}

# This is VPC module 
# In this Vpc, public,private subnets , NAT and IGW is created 
# The route tables are also created for both Public and private subnet


module "AS2_VPC" {
  source = "terraform-aws-modules/vpc/aws"

  name = "AS2_VPC"
  cidr = "10.0.0.0/16"

 # Here I am importing resources from networkresource.tf to created public and private 
 # subnets as per the availability zones
  private_subnets = [aws_subnet.AS2_private_subnet_a.cidr_block,aws_subnet.AS2_private_subnet_b.cidr_block]
  public_subnets  = [aws_subnet.AS2_public_subnet_a.cidr_block,aws_subnet.AS2_public_subnet_b.cidr_block]
  azs             = ["us-east-1a","us-east-1b"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    name= "AS2_VPC"
    Terraform = "true"
    Environment = "dev"
  }
}