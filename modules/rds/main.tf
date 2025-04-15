
// modules/rds/main.tf
resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "Admin1234"
  db_name              = "opencartdb"
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name = aws_db_subnet_group.default.name
  skip_final_snapshot  = true
  publicly_accessible  = true

  tags = {
    Name = "opencart-db"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "opencart-subnet-group"
  subnet_ids = var.subnet_ids   # ✅ correct


  tags = {
    Name = "opencart-db-subnet-group"
  }
}
