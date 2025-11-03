resource "aws_security_group" "student_security_group" {
    vpc_id = aws_vpc.vpc.id
    egress {
      from_port = 0
      to_port = 0
      protocol = -1 
      cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
      description      = "Allow RDP from internal"
      from_port        = 3389
      to_port          = 3389
      protocol         = "tcp"
      cidr_blocks      = ["172.0.0.0/12", "10.0.0.0/8", "192.168.0.0/16"]
    }
        ingress {
      description      = "Allow ANY from internal"
      from_port        = 0
      to_port          = 65535
      protocol         = "tcp"
      cidr_blocks      = ["172.0.0.0/12", "10.0.0.0/8", "192.168.0.0/16"]
    }
    tags = {
        Name = "${local.workspace["student_security_group_name"]}"
    }
}

resource "aws_security_group" "publisher_security_group" {
    vpc_id = aws_vpc.vpc.id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1 
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
    description      = "Allow SSH from Everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
    tags = {
        Name = "${local.workspace["publisher_security_group_name"]}"
    }
}


resource "aws_security_group" "webserver_security_group" {
    vpc_id = aws_vpc.vpc.id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1 
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
    description      = "Allow Port Range from Only Subnet of VPC"
    from_port        = 8000
    to_port          = 8020
    protocol         = "tcp"
    cidr_blocks      = "${local.workspace["subnet2_cidr"]}"
    
  }
    ingress {
    description      = "Allow SSH Public"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
    tags = {
        Name = "${local.workspace["webserver_security_group_name"]}"
    }
}



resource "aws_security_group" "guacamole_security_group" {
    vpc_id = aws_vpc.vpc.id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1 
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
    description      = "Allow HTTPS from everywhere"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "Allow HTTP from everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    description      = "Allow SSH from everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

    tags = {
        Name = "${local.workspace["guacamole_security_group_name"]}"
    }
}

resource "aws_security_group" "master_security_group" {
    vpc_id = aws_vpc.vpc.id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1 
        cidr_blocks      = ["0.0.0.0/0"]
    }

ingress {
    description      = "Allow RDP from everywhere"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] 
  }
        ingress {
      description      = "Allow ANY from internal"
      from_port        = 0
      to_port          = 65535
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.0/8"]
    }
  

    tags = {
        Name = "${local.workspace["master_security_group_name"]}"
    }
}


