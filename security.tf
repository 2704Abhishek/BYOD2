# Upload local public key as an AWS key pair
resource "aws_key_pair" "exam_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# Note: If fileread fails on "~", instruct user to expand ~ or supply absolute path.

# Security Group
resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = aws_vpc.exam_vpc.id

  # Ingress HTTP from anywhere
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress SSH from specified IP/CIDR
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  # Egress all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-server-sg"
  }
}
