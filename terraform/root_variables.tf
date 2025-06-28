## Define image variables

variable "juice_shop_image" {
    description = "Juice Shop Docker image"
    type = string
    default = "bkimminich/juice_shop"
}

variable "zap_image" {
    description = "ZAP Scanner Docker image"
    type = string
    default = "owasp/zap2docker-stable"
}

variable "bandit_image" {
    description = "Python image with Bandit installed"
    type = string
    default = "python:3.10-slim"
}

variable "trivy_image" {
    description = "Trivy image vulnerability scanner"
    type = string
    default = "aquasec/trivy"
}

## EC2 instance type

variable "instance_type" {
    description = "The type of EC2 instance to use"
    type = string
    default = "t2.micro"
}

## Port variables

variable "juice_shop_port" {
    description = "Port Juice Shop will be exposed on"
    type = number
    default = 3000
}

variable "zap_port" {
    description = "Port ZAP Scanner will be exposed on"
    type = number
    default = 8080
}