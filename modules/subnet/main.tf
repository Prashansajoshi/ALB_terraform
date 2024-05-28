resource "aws_subnet" "prashansa_public_subnet_cidr1" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone_1

  tags = {
    Name = "prashansa_public_subnet_cidr1"
    silo = "intern2"
    owner = "prashansa.joshi"
    terraform = "true"
    environment = "dev"
  }
}

resource "aws_subnet" "prashansa_public_subnet_cidr2" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_public_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = "prashansa_public_subnet_cidr2"
    silo = "intern2"
    owner = "prashansa.joshi"
    terraform = "true"
    environment = "dev"
  }
}

resource "aws_subnet" "prashansa_private_subnet_cidr1" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_private_1
  availability_zone = var.availability_zone_1

  tags = {
    Name = "prashansa_private_subnet_cidr1"
    silo = "intern2"
    owner = "prashansa.joshi"
    terraform = "true"
    environment = "dev"
  }
}

resource "aws_subnet" "prashansa_private_subnet_cidr2" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_private_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = "prashansa_private_subnet_cidr2"
    silo = "intern2"
    owner = "prashansa.joshi"
    terraform = "true"
    environment = "dev"
  }
}