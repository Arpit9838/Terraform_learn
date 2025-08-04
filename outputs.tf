# output "ec2_public_ip" {
#   description = "The public IP address of the EC2 instance"
#   value       = aws_instance.my_ec2_instance[*].public_ip
  
# }

output "ec2_public_ip" {
  value = [for key in aws_instance.my_ec2_instance: key.public_ip] 
  #aws_instance.my_ec2_instance: key.public_ip
  # aws_instance.my_ec2_instance.public_ip single instance
  
}

output "ec2_public_dns" {
  value = aws_instance.my_ec2_instance[*].public_dns
}

output "ec2_private_ip" {
  value = aws_instance.my_ec2_instance[*].private_ip
  # aws_instance.my_ec2_instance.private_ip single instance
  # aws_instance.my_ec2_instance[*].private_ip multiple instances
  
}