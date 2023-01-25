# # Creation of a Public Route Table.

# resource "aws_route_table" "route-public_az-ab" {
#   vpc_id = module.AS2_VPC.vpc_id  
#     route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = module.AS2_VPC.igw_id
#   }

#   tags={
#     Name="public-route-table-az-ab"
#   }

# }

# #Asscociating public subnet in availability zone a and availability zone b 
# resource "aws_route_table_association" "public-route-association-public-az-a" {
#   subnet_id      = data.aws_subnet.AS2_public_subnet_a.id
#   route_table_id = aws_route_table.route-public_az-ab.id
# }

# resource "aws_route_table_association" "public-route-association-public-az-b" {
#   subnet_id      = data.aws_subnet.AS2_public_subnet_b.id
#   route_table_id = aws_route_table.route-public_az-ab.id
# }




# #Creating a private route table Using NAT gateway

# resource "aws_route_table" "route-private-az-ab" {
#   vpc_id = module.AS2_VPC.vpc_id
   
#     route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = module.AS2_VPC.natgw_ids[0]
#   }
#   tags={
#     Name="private-route-table-az-a"
#   }

# }


# #Asscociating private subnet1 and private subnet2 with the private route table

# resource "aws_route_table_association" "private-route-association-az-a" {
#   subnet_id      = data.aws_subnet.AS2_private_subnet_a.id
#   route_table_id = aws_route_table.route-private-az-ab.id
# }

# resource "aws_route_table_association" "private-route-association-az-b" {
#   subnet_id      =  data.aws_subnet.AS2_private_subnet_b.id
#   route_table_id = aws_route_table.route-private-az-ab.id
# }