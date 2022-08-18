resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "iac_key"
  public_key = tls_private_key.rsa_key.public_key_openssh
}
