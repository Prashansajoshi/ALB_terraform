resource "aws_instance" "prashansa_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.security_group_id] # Attach the security group
  subnet_id = var.prashansa_public_subnet_cidr1.id
  associate_public_ip_address = true

  tags = {
    Name = "prashansa_ec2"
    silo = "intern2"
    owner = "prashansa.joshi"
    terraform = "true"
    environment = "dev"
  }
}

resource "aws_instance" "instance_type" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.security_group_id] # Attach the security group
  subnet_id = var.prashansa_public_subnet_cidr2.id
  associate_public_ip_address = true

  tags = {
    Name = "prashansa_instance"
    silo = "intern2"
    owner = "prashansa.joshi"
    terraform = "true"
    environment = "dev"
  }
}