output "ec2" {
  value = {
      public_ip  = aws_instance.web.public_ip
      private_ip = aws_instance.web.private_ip
      instance_type  = aws_instance.web.instance_type
      key_name = aws_instance.web.key_name
  }
}