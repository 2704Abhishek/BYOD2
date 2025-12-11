variable "region" {
  type    = string
  default = "us-east-1"
  description = "AWS region to deploy into"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
  description = "CIDR block for the public subnet"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Name to register the SSH key pair in AWS"
  default     = "exam-key"
}

variable "public_key_path" {
  type        = string
  description = "Path to your local public key file (e.g. ~/.ssh/id_rsa.pub) to upload"
  default     = "C:/Users/Abhishek Yadav/.ssh/terraform_key.pub"

}

variable "ssh_allowed_cidr" {
  type        = string
  description = "CIDR allowed to connect via SSH (use your IP or 0.0.0.0/0 if permitted)"
  default     = "0.0.0.0/0"
}
