provider "aws" {
  region = var.aws_region_mod
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block_mod

  tags = {
    Name = var.vpc_name_mod
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 2, 0)
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
