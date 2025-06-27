output "windows_vm_public_ip" {
    description = "Public IP of Windows VM"
    value = aws_instance.windows_vm.public_ip
}