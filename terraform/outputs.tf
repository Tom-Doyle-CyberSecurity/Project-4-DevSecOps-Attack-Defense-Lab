output "juice_shop_url" {
    description = "Access URL for Juice shop"
    value  = "http://localhost:${var.juice_shop_port}"
}

output "zap_url" {
    description = "Access URL for ZAP"
    value = "http://localhost:${var.zap_port}"
}

output "containers" {
    description = "Deployed container names"
    value = [
        docker_container.juice_shop.name,
        docker_container.zap.name,
        docker_container.bandit.name,
        docker_container.trivy.name
    ]
}