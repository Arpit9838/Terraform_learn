output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.my_ec2_instance.public_ip
  
}

output "ec2_public_dns" {
  value = aws_instance.my_ec2_instance.public_dns
}

output "ec2_private_ip" {
  value = aws_instance.my_ec2_instance.private_ip
  
}