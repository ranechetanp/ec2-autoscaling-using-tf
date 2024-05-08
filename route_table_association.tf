resource "aws_route_table_association" "route_table_1" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.route_table.id
}