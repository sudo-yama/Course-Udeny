provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami                    = "ami-0a0e5d9c7acc336f1"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "jenkins-key"
  subnet_id              = "subnet-07f2476268f1434ca"
  vpc_security_group_ids = ["sg-0dc1158afacec5139"] # Updated to correct attribute name
  tags = {
    Name    = "tf"
    Project = "test"
  }
}
