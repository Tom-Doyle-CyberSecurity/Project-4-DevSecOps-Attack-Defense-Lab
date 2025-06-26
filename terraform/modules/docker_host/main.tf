resource "aws_instance "docker_host" {
    ami = "ami-078772dab3242ee11
    instance_type = "t2.micro"
    key_name = var.key_name

    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    user_data = <<-EOF
        #!/bin/bash
        yum update -y
        yum install -y docker git
        systemctl enable docker
        usermod -aG docker ec2-user
        EOF

    tags = {
        Name = "DevSecOps-Docker-Host"
    }

    resource "aws_security_group" "allow_ssh" {
        name = "allow_ssh"
        description = "Allow SSH from specific IP"
    }

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

