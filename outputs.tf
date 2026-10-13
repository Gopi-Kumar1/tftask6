output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of all public subnets."
  value = [
    aws_subnet.pub_sub_a.id,
    aws_subnet.pub_sub_b.id,
    aws_subnet.pub_sub_c.id,
  ]
}

output "public_subnet_cidr_block" {
  description = "CIDR blocks of all public subnets."
  value = [
    aws_subnet.pub_sub_a.cidr_block,
    aws_subnet.pub_sub_b.cidr_block,
    aws_subnet.pub_sub_c.cidr_block,
  ]
}

output "public_subnet_availability_zone" {
  description = "Availability Zones of all public subnets."
  value = [
    aws_subnet.pub_sub_a.availability_zone,
    aws_subnet.pub_sub_b.availability_zone,
    aws_subnet.pub_sub_c.availability_zone,
  ]
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway."
  value       = aws_internet_gateway.this.id
}

output "routing_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.this.id
}