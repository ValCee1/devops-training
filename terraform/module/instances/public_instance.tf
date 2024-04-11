resource "aws_instance" "public" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id] # Security Group
  subnet_id              = var.public_subnet_id    # public subnet
  count                  = var.create_pub_instance == true ? 1 : 0
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.environment} Public Instance"
    Environment = "${var.environment}"
    Application = "web-${var.environment} "
    Subnet      = "public"
    vpc         = "General-${var.environment} "
    Department  = "${var.department} "
  }
}
