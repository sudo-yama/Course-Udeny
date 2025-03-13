resource "aws_instance" "test-var" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "jenkins-key"
  subnet_id              = "subnet-07f2476268f1434ca"
  vpc_security_group_ids = ["sg-0dc1158afacec5139"] 
  tags = {
    Name    = "tf"
    Project = "test"
  }
}  