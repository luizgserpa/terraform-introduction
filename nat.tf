resource "aws_nat_gateway" "gw" {
  allocation_id     = aws_eip.default.id
  subnet_id         = aws_subnet.main_public.id
  connectivity_type = "public"

  tags = {
    "Name" = "Demo Nat Gateway"
  }
}