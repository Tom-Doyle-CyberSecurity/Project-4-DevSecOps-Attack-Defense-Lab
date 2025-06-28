output "docker_host_ssh_command" {
    description = "SSH command to connect to the Docker Host"
    value = module.docker_host.docker_host_ssh_command
}

output "docker_host_public_ip" {
    description = "Public IP of the Docker Host"
    value = module.docker_host.docker_host_public_ip
}

output "juice_shop_url" {
    description = "Access URL for Juice shop"
    value  = "http://${module.docker_host.docker_host_public_ip}:3000"
}

output "zap_url" {
    description = "Access URL for ZAP"
    value = "http://${module.docker_host.docker_host_public_ip}:8080"
}