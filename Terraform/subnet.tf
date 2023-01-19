 # Resources created as per the availabilty ozones
# Here 2 public and 2 private subnets are created in each Availability zone.
 
 resource "aws_subnet" "AS2_private_subnet_a" {
  vpc_id            = module.AS2_VPC.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.AS2_VPC.natgw_ids[0]
  }
  tags = {
    name="AS2_private_subnet_a"
  }
}

resource "aws_subnet" "AS2_private_subnet_b" {
  vpc_id            = module.AS2_VPC.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.AS2_VPC.natgw_ids[1]
  }
   tags = {
    name="AS2_private_subnet_b"
  }
}
resource "aws_subnet" "AS2_public_subnet_a" {
  vpc_id            = module.AS2_VPC.vpc_id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "us-east-1a"
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.AS2_VPC.igw_id
  }
   tags = {
    name="AS2_public_subnet_a"
  }
}
resource "aws_subnet" "AS2_public_subnet_b" {
  vpc_id            = module.AS2_VPC.vpc_id
  cidr_block        = "10.0.102.0/24"
  availability_zone = "us-east-1b"
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.AS2_VPC.igw_id
  }
  tags = {
    name="AS2_public_subnet_b"
  }
}

data "aws_subnet" "AS2_private_subnet_a" {
  id = aws_subnet.AS2_private_subnet_a.id
}
data "aws_subnet" "AS2_private_subnet_b" {
  id = aws_subnet.AS2_private_subnet_b.id
}
data "aws_subnet" "AS2_public_subnet_a" {
  id = aws_subnet.AS2_public_subnet_a.id
}
data "aws_subnet" "AS2_public_subnet_b" {
  id = aws_subnet.AS2_public_subnet_b.id
}