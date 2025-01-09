
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {}

############################################################
###           STUDENT USER PREFIX                        ###
############################################################

variable "student_prefix" {
    type = string
    description = "prefix of student instances?"
    default = "student"
}

############################################################
#             vpc.tf VARIABLES 
############################################################

variable "vpc_dns_support" {
    type = bool
    default = "true"
}
variable "vpc_dns_hosnames" {
    type = bool
    default = "true"
}
variable subnet1_map_public_ip_on_launch { 
    type = bool
    default = "true"
}
variable subnet2_map_public_ip_on_launch { 
    type = bool
    default = "true"
}
############################################################
#             instance.tf VARIABLES 
############################################################
variable "key_name" {
    type = string
    default = "CSW-key-pair-01"
}

variable "student_instance_ami" {
    type = string
    default = "ami-0546311a07250f160"
}
variable "student_instance_type" {
    type = string
    default = "t3.large"
}
variable "student_instance_count" {
    type = number 
    description = "Number of studentPCs?"
}

variable "publisher_instance_ami" {
    type = string
    default = "ami-08e2a17c8e2330cd6"
}
variable "publisher_instance_type" {
    type = string
    default = "t3.small"
}

variable "webserver_instance_ami" {
    type = string
    default = "ami-0a7d9ad8aea474ed7"
}
variable "webserver_instance_type" {
    type = string
    default = "t3.small"
}

variable "guacamole_instance_ami" {
    type = string
    default = "ami-04d29be4d6f442172"
}
variable "guacamole_instance_type" {
    type = string
    default = "t3.large"
}

variable "master_instance_ami" {
    type = string
    default = "ami-0c1e6dc9f1cc6950c"
}
variable "master_instance_type" {
    type = string
    default = "t3.large"
}

############################################################
#             route53.tf VARIABLES 
############################################################

variable "private_zone_name" {
    type = string
    default = "csw.netskope.internal"
}
variable "public_zone_name" {
    type = string
    default = "sselab.eu"
}

variable "student_private_zone_record_prefix" {
    type = string
    default = "student"
}
variable "hosted-zone" {
  description = "The name of the dns zone on Route 53 that will be used as the master zone "
  default     = "sselab.eu"
}

variable "csw_publisher" {
  description = "Shall the regular CSW Lab Publisher be used?"
  type        = bool
  default     = "true"
}

variable "ubuntu_publisher" {
  description = "Set to true if you want to deploy a new publisher with new token"
  type        = bool
  default     = "false"
}

variable "token" {
  description = "Enter the new Publisher token"
  type        = string
}

# variable condition
# value = "${var.token != "" ? var.name : var.name2}"
