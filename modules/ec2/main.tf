
// modules/ec2/main.tf
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (us-east-2)
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd php php-mysqlnd git
              systemctl start httpd
              systemctl enable httpd
              cd /var/www/html
              git clone https://github.com/shivakarthikreddyk/opencart.git
              EOF

  tags = {
    Name = "opencart-web"
  }
}