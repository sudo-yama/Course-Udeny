resource "aws_security_group" "dove_stack_sg" {
  vpc_id      = aws_vpc.dove_vpc.id
  name        = "dove-stack-sg"
  description = "sec grp for dove ssh"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  tags = {
    Name = "allow-ssh"
  }
}