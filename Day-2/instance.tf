resource "aws_instance" "Terrafrom_server-01" {
    ami               = var.AMIS[var.REGION]
    instance_type     = "t2.micro"
    availability_zone = var.ZONE1
    key_name = "test"
    vpc_security_group_ids = ["sg-00314af27c6b53087"]
    tags = {
        Name = "Terrafrom_server"
    }
}