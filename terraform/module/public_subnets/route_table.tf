#Routing Table for NAT for departmental public subnet
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.ALL_IPs
    gateway_id = var.gateway_id
  }

  tags = {
    Name        = "${var.department}-public-route"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }

}
