output "public_subnet_1" {
    value = aws_subnet.prashansa_public_subnet_cidr1.id
}

output "public_subnet_2" {
    value = aws_subnet.prashansa_public_subnet_cidr2.id
}

output "private_subnet_1" {
    value = aws_subnet.prashansa_private_subnet_cidr1.id
}

output "private_subnet_2" {
    value = aws_subnet.prashansa_private_subnet_cidr2.id
}