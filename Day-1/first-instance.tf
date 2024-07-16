provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "intro" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
    key_name = "test"
    vpc_security_group_ids = ["sg-00314af27c6b53087"]
    tags = {
        Name = "Terrafrom_server"
    }
}
