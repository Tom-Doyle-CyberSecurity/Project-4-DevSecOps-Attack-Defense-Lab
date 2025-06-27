variable "key_name" {
    description = "Name of the EC2 key pair"
    type = string
}

variable "my_ip" {
    description = "IP with /32 for ssh access"
    type = string
}

variable "ami_id" {
    description = "AMI ID for Docker Host (e.g, Amazon linux 2)"
    type = string
}

resource "aws_security_group" "allow_ssh" {
    vpc_id = var.vpc_id
}

resource "aws_instance" "docker_host" {
    subnet_id = var.subnet_id
}