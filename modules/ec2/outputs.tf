// modules/ec2/outputs.tf
output "public_ip" {
  value = aws_instance.web.public_ip
}
