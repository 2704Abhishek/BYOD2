output "instance_id" {
  description = "EC2 instance id"
  value       = aws_instance.web.id
}

output "public_ipv4" {
  description = "Public IPv4 address of the web server"
  value       = aws_instance.web.public_ip
}

output "web_url" {
  description = "HTTP URL for the web server"
  value       = "http://${aws_instance.web.public_ip}"
}
