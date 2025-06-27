## Define variables

variable "juice_shop_image" {
    description = "juice_shop_image"
    default = "bkimminich/juice_shop"
}

variable "zap_image" {
    description = "ZAP Scanner Docker image"
    default = "bkimminich/juice-shop"
}

variable "bandit_image" {
    description = "Python image with Bandit installed"
    default = "python:3.10-slim"
}

variable "trivy_image" {
    description = "Trivy image vulnerability scanner"
    default = "aquasec/trivy"
}

variable "instance_type" {}
variable "juice_shop_image" {}
variable "zap_image" {}

## Define ports 

variable "juice_shop_port" {
    default = 3000
}

variable "zap_port" {
    default = 8080
}