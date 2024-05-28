resource "aws_vpc" "prashansa_terraform_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "prashansa_terraform_vpc"
  }
}
