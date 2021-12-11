resource "aws_security_group" "Bastion" {
  name        = "Bastion"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = ""
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [ "0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []
    self             = false 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags     = {
    Name    = "${var.project}-bastion"
    project = var.project
  }
}


resource "aws_security_group" "Webserver" {
  name        = "Webserver"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress = [
      
      {
    description      = ""
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    security_groups = []
    prefix_list_ids  = []
    self             = false 
  },

  {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    security_groups  = []
    prefix_list_ids  = []
    self             = false 
  },

  {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = []
    ipv6_cidr_blocks = []
    security_groups = [aws_security_group.Bastion.id]
    prefix_list_ids  = []
    self             = false 
  }
  
  
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags     = {
    Name    = "${var.project}-webserver"
    project = var.project
  }
}


resource "aws_security_group" "database" {
  name        = "database"
  description = "Allow db access from webserver, SSH from bastion"
  vpc_id      = aws_vpc.vpc.id

  ingress = [
      
      {
    description      = ""
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = []
    ipv6_cidr_blocks = []
    security_groups =  [aws_security_group.Webserver.id]
    prefix_list_ids  = []
    self             = false 
  },

  {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = []
    ipv6_cidr_blocks = []
    security_groups = [aws_security_group.Bastion.id]
    prefix_list_ids  = []
    self             = false 
  }
  
  
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags     = {
    Name    = "${var.project}-database"
    project = var.project
  }
}





