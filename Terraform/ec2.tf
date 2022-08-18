resource "aws_instance" "webserver" {
  ami                    = "ami-090fa75af13c156b4"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web_sub.id
  
  tags = {
    Project = "IAC"
  }

}

