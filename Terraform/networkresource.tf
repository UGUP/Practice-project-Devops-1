# Resources created as per the availabilty ozones
# Here 2 public and 2 private subnets are created in each Availability zone.

resource "aws_subnet" "AS2_private_subnet_a" {
  vpc_id            = module.AS2-VPC.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "AS2_private_subnet_b" {
  vpc_id            = module.AS2-VPC.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}
resource "aws_subnet" "AS2public_subnet_a" {
  vpc_id            = module.AS2-VPC.vpc_id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "us-east-1a"
}
resource "aws_subnet" "AS2_public_subnet_b" {
  vpc_id            = module.AS2-VPC.vpc_id
  cidr_block        = "10.0.102.0/24"
  availability_zone = "us-east-1b"
}
