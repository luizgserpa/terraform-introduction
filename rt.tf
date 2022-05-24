resource "aws_route_table" "main_public" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "Public RT"
  }
}

resource "aws_route_table_association" "main_public" {
  subnet_id      = aws_subnet.main_public.id
  route_table_id = aws_route_table.main_public.id
}

resource "aws_route" "main_public_gw" {
  route_table_id         = aws_route_table.main_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table" "main_private" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "Private RT"
  }
}

resource "aws_route_table_association" "main_private" {
  subnet_id      = aws_subnet.main_private.id
  route_table_id = aws_route_table.main_private.id
}

resource "aws_route" "main_private_gw" {
  route_table_id         = aws_route_table.main_private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.gw.id
}