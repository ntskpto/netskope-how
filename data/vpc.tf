resource "aws_vpc" "vpc" {
    cidr_block = flatten("${local.workspace["vpc_cidr"]}")[0]
    enable_dns_support = var.vpc_dns_support
    enable_dns_hostnames = var.vpc_dns_hosnames
    
  tags = {
    Name = "${local.workspace["vpc_name"]}"
  }
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = flatten("${local.workspace["subnet1_cidr"]}")[0]
    map_public_ip_on_launch = var.subnet1_map_public_ip_on_launch
    
    tags = {
        Name = "${local.workspace["subnet1_name"]}"
    }
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = flatten("${local.workspace["subnet2_cidr"]}")[0]
    map_public_ip_on_launch = var.subnet2_map_public_ip_on_launch
    
    tags = {
        Name = "${local.workspace["subnet2_name"]}"
    }
}
