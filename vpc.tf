locals {
  vpc_name         = "${var.project_id}-01-vpc"
  public_subnet_a  = "${var.project_id}-01-subnet-public-a"
  public_subnet_b  = "${var.project_id}-01-subnet-public-b"
  public_subnet_c  = "${var.project_id}-01-subnet-public-c"
  internet_gateway = "${var.project_id}-01-igw"
  route_table      = "${var.project_id}-01-rt"
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = local.vpc_name
  }
}

resource "aws_subnet" "pub_sub_a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_a_cidr
  availability_zone = var.az_a

  tags = {
    Name = local.public_subnet_a
  }
}

resource "aws_subnet" "pub_sub_b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_b_cidr
  availability_zone = var.az_b

  tags = {
    Name = local.public_subnet_b
  }
}

resource "aws_subnet" "pub_sub_c" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_c_cidr
  availability_zone = var.az_c

  tags = {
    Name = local.public_subnet_c
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.internet_gateway
  }
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.internet_cidr
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = local.route_table
  }
}

resource "aws_route_table_association" "pub_sub_a" {
  subnet_id      = aws_subnet.pub_sub_a.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "pub_sub_b" {
  subnet_id      = aws_subnet.pub_sub_b.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "pub_sub_c" {
  subnet_id      = aws_subnet.pub_sub_c.id
  route_table_id = aws_route_table.this.id
}