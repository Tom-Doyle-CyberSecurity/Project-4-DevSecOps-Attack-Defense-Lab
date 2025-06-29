terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }

    required_version = ">= 1.3.0"
}

provider "aws" {
    region = "ap-southeast-2" 
}

module "docker_host" {
    source = "./modules/docker_host"
    ami_id = var.ami_id
    key_name = var.key_name
    subnet_id = var.subnet_id
    vpc_id = var.vpc_id
    my_ip = var.my_ip
}