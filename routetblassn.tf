resource "aws_route_table_association" "public01" {
  subnet_id      = aws_subnet.public01.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public02" {
  subnet_id      = aws_subnet.public02.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public03" {
  subnet_id      = aws_subnet.public03.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "private01" {
  subnet_id      = aws_subnet.private01.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private02" {
  subnet_id      = aws_subnet.private02.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private03" {
  subnet_id      = aws_subnet.private02.id
  route_table_id = aws_route_table.private.id
}




