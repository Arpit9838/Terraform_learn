variable "ec2_instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t3.micro"
  
}

variable "my_ec2_instance_root_storage_size" {
  description = "The size of the root block device in GB"
  type        = number
  default     = 15
  
}

variable "ec2_ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-020cba7c55df1f615" # Example AMI ID, replace with a valid one for your region
  
}

variable "env" {
  description = "The environment for the EC2 instance (e.g., dev, staging, prd)"
  type        = string
  default     = "dev"
  
  
}