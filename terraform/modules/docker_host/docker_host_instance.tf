resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh_juice_zap"
    description = "Allow SSH, Juice Shop, and ZAP traffic"
    vpc_id = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }

    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }

    ingress {
        from_port = 8080
        to_port = 8080
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

resource "aws_instance" "docker_host" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = var.key_name
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    associate_public_ip_address = true

    user_data = <<-EOF
        #!/bin/bash
        yum update -y
        amazon-linux-extras install docker -y
        systemctl enable docker
        systemctl start docker
        docker run -d -p 3000:3000 bkimminich/juice_shop
        docker run -d -p 8080:8080 owasp/zap2docker-stable
    EOF

    tags = {
        Name = "DevSecOps-Docker-Host"
    }
}