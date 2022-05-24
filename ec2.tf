data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = var.keyname
  subnet_id              = aws_subnet.main_public.id
  vpc_security_group_ids = [aws_security_group.default.id]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.demo.private_key_pem
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install nginx -y",
      "sudo systemctl start nginx",
      "sudo rm /var/www/html/*",
      "sudo wget https://public-luiz-serpa.s3.amazonaws.com/index.html -P /var/www/html/"
    ]
  }
  tags = {
    Name = "Demo NGINX"
  }
}