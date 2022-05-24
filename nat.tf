resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.default.id
  subnet_id     = aws_subnet.main_public.id
}