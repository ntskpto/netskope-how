resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${local.workspace["igw_name"]}"
    }
}

resource "aws_route_table" "route_table1" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    
    tags = {
        Name = "${local.workspace["route_table1_name"]}"
    }
}

resource "aws_route_table_association" "Subnet1-Assoc" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.route_table1.id
}
resource "aws_route_table_association" "Subnet2-Assoc" {
    subnet_id = aws_subnet.subnet2.id
    route_table_id = aws_route_table.route_table1.id
}
