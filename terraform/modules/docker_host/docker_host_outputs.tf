output "docker_host_public_ip" {
    description = "The public IP of the Docker Host EC2 instance"
    value = aws_instance.docker_host.public_ip
}

output "docker_host_instance_id" {
    description = "The EC2 instance ID of the Docker Host"
    value = aws_instance.docker_host.id
}

output "docker_host_ssh_command" {
    description = "SSH command to connect to the Docker Host"
    value = "ssh -i ~/.ssh/${var.key_name}.pem ec2-user@${aws_instance.docker_host.public_ip}"
}