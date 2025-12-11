# Data source for latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  key_name               = aws_key_pair.exam_key.key_name
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y

# Install nginx from Amazon Linux Extras
sudo amazon-linux-extras enable nginx1
sudo yum install -y nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Replace default HTML file
echo "<h1>Project Genesis SUCCESS! Deployed by Abhishek Yadav</h1>" | sudo tee /usr/share/nginx/html/index.html
EOF


  tags = {
    Name = "web-server-instance-abhishek-yadav"
  }
}
