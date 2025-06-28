variable "key_name" {
    description = "Name of the EC2 key pair"
    type = string
}

variable "my_ip" {
    description = "IP with /32 for ssh access"
    type = string
}

variable "subnet_id" {
    description = "The ID of of the subnet to launch the Docker Host EC2 instance in"
    type = string
}

variable "vpc_id" {
    description = "The ID of the VPC to place the security group in"
    type = string
}

variable "ami_id" {
    description = "AMI ID to use for the Docker Host EC2 instance (Amzon Linux 2)"
    type = string
}

