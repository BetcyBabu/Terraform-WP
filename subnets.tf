# public subnets

resource "aws_subnet" "public01" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 3, 0)
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true


  tags = {
    Name = "${var.project}-public01"
  }
}

resource "aws_subnet" "public02" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 3, 1)
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  

  tags = {
    Name = "${var.project}-public02"
  }
}

resource "aws_subnet" "public03" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 3, 2)
  availability_zone = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true
  

  tags = {
    Name = "${var.project}-public03"
  }
}

# private subnets

resource "aws_subnet" "private01" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 3, 3)
  availability_zone = data.aws_availability_zones.available.names[0]
  

  tags = {
    Name = "${var.project}-private01"
  }
}

resource "aws_subnet" "private02" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 3, 4)
  availability_zone = data.aws_availability_zones.available.names[1]
  

  tags = {
    Name = "${var.project}-private02"
  }
}

resource "aws_subnet" "private03" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 3, 5)
  availability_zone = data.aws_availability_zones.available.names[2]
  

  tags = {
    Name = "${var.project}-private03"
  }
}