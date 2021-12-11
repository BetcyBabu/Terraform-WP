resource "aws_instance" "web" {
  ami           =  "ami-052cef05d01020f1d"
  instance_type = var.type
  key_name = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.Webserver.id]
  subnet_id = aws_subnet.public01.id
  user_data = templatefile("wordpress.tpl", {db_host = aws_instance.database.private_ip})
  tags = {
    Name = "${var.project}-webserver"
  }

  depends_on = [aws_instance.database]
}


resource "aws_instance" "database" {
  ami           =  "ami-052cef05d01020f1d"
  instance_type = var.type
  key_name = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.database.id]
  subnet_id = aws_subnet.private01.id
  user_data = file("./db.sh")
  tags = {
    Name = "${var.project}-database"
  }
}

resource "aws_instance" "Bastion" {
  ami           =  "ami-052cef05d01020f1d"
  instance_type = var.type
  key_name = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.Bastion.id]
  subnet_id = aws_subnet.public02.id

  tags = {
    Name = "${var.project}-Bastion"
  }
}