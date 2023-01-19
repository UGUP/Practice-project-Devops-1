resource "aws_route_table" "route-public_az-a" {
  vpc_id = module.AS2_VPC.vpc_id  
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.AS2_VPC.igw_id
  }

  tags={
    Name="public-route-table-az-a"
  }

}

resource "aws_route_table" "route-public_az-b" {
  vpc_id = module.AS2_VPC.vpc_id  
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.AS2_VPC.igw_id
  }

  tags={
    Name="public-route-table-az-b"
  }

}

#Asscociating public subnet1 and public subnet2 with the public route table

resource "aws_route_table_association" "public-route-association-public-az-a" {
  subnet_id      = aws_subnet.AS2_public_subnet_a.id
  route_table_id = aws_route_table.route-public_az-a.id
}

resource "aws_route_table_association" "public-route-association-public-az-b" {
  subnet_id      = aws_subnet.AS2_public_subnet_b.id
  route_table_id = aws_route_table.route-public_az-b.id
}




#Creating a private route table Using NAT gateway

resource "aws_route_table" "route-private-az-a" {
  vpc_id = module.AS2_VPC.vpc_id
   
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.AS2_VPC.natgw_ids[0]
  }
  tags={
    Name="private-route-table-az-a"
  }

}

resource "aws_route_table" "route-private-az-b" {
  vpc_id = module.AS2_VPC.vpc_id
   
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.AS2_VPC.natgw_ids[1]
  }
  tags={
    Name="private-route-table-az-b"
  }

}


#Asscociating private subnet1 and private subnet2 with the private route table

resource "aws_route_table_association" "private-route-association-az-a" {
  subnet_id      = aws_subnet.AS2_private_subnet_a.id
  route_table_id = aws_route_table.route-private-az-a.id
}

resource "aws_route_table_association" "private-route-association-az-b" {
  subnet_id      = aws_subnet.AS2_private_subnet_b.id
  route_table_id = aws_route_table.route-private-az-b.id
}