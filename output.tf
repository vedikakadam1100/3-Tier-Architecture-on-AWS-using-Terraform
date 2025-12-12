
output "web_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "app_private_ip" {
  value = aws_instance.app_server.private_ip
}

output "db_private_ip" {
  value = aws_instance.db_server.private_ip
}
