resource "aws_subnet" "main_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_public_cidr_block
}

resource "aws_subnet" "main_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_private_cidr_block
}