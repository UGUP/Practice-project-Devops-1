module "AS2-VPC" {
  source = "terraform-aws-modules/vpc/aws"

  name = "AS2-VPC"
  cidr = "10.0.0.0/16"

  private_subnets = [aws_subnet.private_subnet_a.id,aws_subnet.private_subnet_b.id]
  public_subnets  = [aws_subnet.public_subnet_a.id,aws_subnet.public_subnet_b.id]
  azs             = ["us-east-1a","us-east-1b"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}