#Routing Table for NAT for departmental private subnet
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  route {
    cidr_block           = var.ALL_IPs
    network_interface_id = aws_network_interface.private.id
  }

  tags = {
    Name        = "${var.department}-private-route"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }

}
