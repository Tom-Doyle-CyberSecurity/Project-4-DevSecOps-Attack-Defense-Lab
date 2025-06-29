variable "ami_id" {
    description = "AMI ID to use for the EC2 instance"
    type = string
}

variable "key_name" {
    description = "Name of the AWS EC2 key pair"
    type = string
}

variable "subnet_id" {
    description = "VPC ID associated with /32 CIDR suffix"
    type = string
}

variable "vpc_id" {
    description = "VPC ID associated with the instance"
    type = string
}

variable "my_ip" {
    description = "Your public IP address with /32 CIDR suffix"
    type = string
}