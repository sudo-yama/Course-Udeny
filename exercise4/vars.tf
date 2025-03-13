variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"

}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-066784287e358dad1"
    us-east-2 = "ami-0a0e5d9c7acc336f1"
  }
}

variable "USER" {
  default = "ec2-user"

}