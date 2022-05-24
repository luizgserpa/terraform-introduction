resource "tls_private_key" "demo" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.keyname
  public_key = tls_private_key.demo.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.demo.private_key_pem}' > ./'${var.keyname}'.pem
      chmod 400 ./'${var.keyname}'.pem
    EOT
  }

}