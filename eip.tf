resource "aws_eip" "default" {
  tags = {
    "Name" = "Demo Elastic IP"
  }
}