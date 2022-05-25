resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = var.keyname
  subnet_id              = aws_subnet.main_public.id
  vpc_security_group_ids = [aws_security_group.default.id]

  user_data = <<EOF
        user_data = <<EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install nginx -y
        sudo systemctl start nginx
        sudo rm /var/www/html/*
        sudo wget https://public-luiz-serpa.s3.amazonaws.com/index.html -P /var/www/html/
EOF

  tags = {
    Name = "Demo NGINX"
  }
}