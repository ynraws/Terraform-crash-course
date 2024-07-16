variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    ap-south-1 = "ami-0ec0e125bb6c6e8ec"
  }
}

variable "USER" {
  default = "ec2-user"
}