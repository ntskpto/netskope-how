locals {
  env = {
    marcus = {
      name                    = "marcus"
      vpc_cidr                = ["10.1.0.0/16"]
      subnet1_cidr            = ["10.1.1.0/24"]
      subnet2_cidr            = ["10.1.2.0/24"]
      vpc_name                = "vpc-marcus-csw"
      subnet1_name            = "Subnet1-Marcus"
      subnet2_name            = "Subnet2-Marcus"
      publisher_security_group_name = "publisher-SG-marcus"
      webserver_security_group_name = "webserver-SG-marcus"
      student_security_group_name   = "student-SG-marcus"
      guacamole_security_group_name = "guacamole-SG-marcus"
      master_security_group_name    = "master-SG-marcus"
      route_table1_name             = "route-table-marcus"
      igw_name                      = "igw-marcus"
      namespace                     = "mj"
    }

    phil = {
      name                    = "phil"
      vpc_cidr                = ["10.0.0.0/16"]
      subnet1_cidr            = ["10.0.1.0/24"]
      subnet2_cidr            = ["10.0.2.0/24"]
      vpc_name                = "vpc-phil-csw"
      subnet1_name            = "Subnet1-phil"
      subnet2_name            = "Subnet2-phil"
      publisher_security_group_name = "publisher-SG-phil"
      webserver_security_group_name = "webserver-SG-phil"
      student_security_group_name   = "student-SG-phil"
      guacamole_security_group_name = "guacamole-SG-phil"
      master_security_group_name    = "master-SG-phil"
      route_table1_name             = "route-table-phil"
      igw_name                      = "igw-phil"
      namespace                     = "pr"
    }
    georg = {
      name                    = "georg"
      vpc_cidr                = ["10.2.0.0/16"]
      subnet1_cidr            = ["10.2.1.0/24"]
      subnet2_cidr            = ["10.2.2.0/24"]
      vpc_name                = "vpc-georg-csw"
      subnet1_name            = "Subnet1-georg"
      subnet2_name            = "Subnet2-georg"
      publisher_security_group_name = "publisher-SG-georg"
      webserver_security_group_name = "webserver-SG-georg"
      student_security_group_name   = "student-SG-georg"
      guacamole_security_group_name = "guacamole-SG-georg"
      master_security_group_name    = "master-SG-georg"
      route_table1_name             = "route-table-phil"
      igw_name                      = "igw-phil"
      namespace                     = "gh"
    }
    rainer = {
      name                    = "rainer"
      vpc_cidr                = ["10.3.0.0/16"]
      subnet1_cidr            = ["10.3.1.0/24"]
      subnet2_cidr            = ["10.3.2.0/24"]
      vpc_name                = "vpc-rainer-csw"
      subnet1_name            = "Subnet1-rainer"
      subnet2_name            = "Subnet2-rainer"
      publisher_security_group_name = "publisher-SG-rainer"
      webserver_security_group_name = "webserver-SG-rainer"
      student_security_group_name   = "student-SG-rainer"
      guacamole_security_group_name = "guacamole-SG-rainer"
      master_security_group_name    = "master-SG-rainer"
      route_table1_name             = "route-table-rainer"
      igw_name                      = "igw-rainer"
      namespace                     = "rs"
    }
    eugen = {
      name                    = "eugen"
      vpc_cidr                = ["10.4.0.0/16"]
      subnet1_cidr            = ["10.4.1.0/24"]
      subnet2_cidr            = ["10.4.2.0/24"]
      vpc_name                = "vpc-marcus-csw"
      subnet1_name            = "Subnet1-marcus"
      subnet2_name            = "Subnet2-marcus"
      publisher_security_group_name = "publisher-SG-eugen"
      webserver_security_group_name = "webserver-SG-eugen"
      student_security_group_name   = "student-SG-eugen"
      guacamole_security_group_name = "guacamole-SG-eugen"
      master_security_group_name    = "master-SG-eugen"
      route_table1_name             = "route-table-eugen"
      igw_name                      = "igw-eugen"
      namespace                     = "en"
    }
  }
  workspace = "${local.env[terraform.workspace]}"
}

