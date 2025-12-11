# VPC
resource "aws_vpc" "exam_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "exam-vpc-abhishek-yadav"
    Project = "ProjectGenesis"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.exam_vpc.id

  tags = {
    Name = "exam-igw-abhishek-yadav"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.exam_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "exam-public-subnet-abhishek-yadav"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.exam_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "exam-public-rt-abhishek-yadav"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Data source for AZs
data "aws_availability_zones" "available" {
  state = "available"
}
