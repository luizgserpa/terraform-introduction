resource "aws_route_table" "main_public" {
  vpc_id = aws_vpc.main.id

  route = []
}

resource "aws_route_table_association" "main_public" {
  subnet_id      = aws_subnet.main_public.id
  route_table_id = aws_route_table.main_public.id
}

resource "aws_route_table" "main_private" {
  vpc_id = aws_vpc.main.id

  route = []
}

resource "aws_route_table_association" "main_private" {
  subnet_id      = aws_subnet.main_private.id
  route_table_id = aws_route_table.main_private.id
}