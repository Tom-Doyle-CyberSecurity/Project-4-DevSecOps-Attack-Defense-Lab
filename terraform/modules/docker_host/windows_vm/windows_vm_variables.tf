variable "ami_id" {
    description = "AMI ID for the Windows Server EC2"
    type = string
}

variable "instance_type" {
    description = "EC2 instance type (e.g. t2.medium)"
    type = string
}

variable "key_name" {
    description = "Key pair name for SSH/RDP access"
    type = string
}

variable "subnet_id" {
    description = "Subnet ID to launch the instance in"
    type = string
}

variable "security_group_id" {
    description = "Security group allowing RDP from IP"
    type = string
}