
resource "aws_instance" "jump_box" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = var.instance_type
  key_name      = "iac_key"

  subnet_id              = aws_subnet.pub_sub.id
  vpc_security_group_ids = [aws_security_group.general_sg.id, aws_security_group.bastion_sg.id]

  tags = {
    Project = "IAC"
  }
}

resource "aws_instance" "app_instance" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = var.instance_type
  key_name      = "iac_key"

  subnet_id              = aws_subnet.prv_sub.id
  vpc_security_group_ids = [aws_security_group.general_sg.id, aws_security_group.app_sg.id]

  tags = {
    Project = "IAC"
  }
}
