 #key pair
 
resource "aws_key_pair" "my_key_pair" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

#vpc and security group
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "my_security_group"
  description = "Allow SSH and HTTP traffic for terraform EC2 instances"
  vpc_id     = aws_default_vpc.default.id 
  #interpolating the default VPC ID


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   description = "Allow SSH access from anywhere"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP access from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"#specifying all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#ec2 instance
resource "aws_instance" "my_ec2_instance" {
  ami           = var.ec2_ami_id # Example AMI ID, replace with a valid one for your region
  instance_type = each.value
  key_name      = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.my_security_group.name]
  # count         = 2 # Creating two instances
  user_data     = file("install_nginx.sh")
  
  for_each = tomap(
    {
      "instance1" = "t2.micro",
      "instance2" = "t3.micro"
    }
  )
  
 root_block_device {
   volume_size =  var.env == "prd" ? 20 : var.my_ec2_instance_root_storage_size
   volume_type = "gp3"
 }

depends_on = [ aws_security_group.my_security_group ]
  tags = {
    Name = each.key
  }
}

