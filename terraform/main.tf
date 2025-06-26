terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.2"
        }
    }
}

provider "docker" {
    host = "unix://var/run/docker.sock"
}

# Image definitions 

resource "docker_image" "juice_shop" {
    name = var.juice_shop_image
}

resource "docker_image" "zap" {
    name = var.zap_image
}

resource "docker_image" "bandit" {
    name = var.bandit_image
}

resource "docker_image" "trivy" {
    name = var.trivy_image
}

# Container definitions

# Juice Shop container
resource "docker_container" "juice_shop" {
    name = "juice-shop"
    image = docker_image.juice_shop.name

        ports {
        internal = var.juice_shop_port
        external = var.juice_shop_port
    }
}

# Zap container
resource "docker_container" "zap" {
    name = "zap"
    image = docker_image.zap.name

    ports {
        internal = var.zap_port
        external = var.zap_port
    }
}

# Bandit container (no ports usually needed)
resource "docker_container" "bandit" {
    name = "bandit"
    image = docker_image.bandit.name
}

# Trivy container (no ports usually needed)
resource "docker_container" "trivy" {
    name = "trivy"
    image = docker_image.trivy.name
}

module "docker_host {
    source = "./modules/docker_host"
    instance_type = var.instance_type
    juice_shop_image = var.juice_shop_image
    zap_image = var.zap_image
}