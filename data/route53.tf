resource "aws_route53_zone" "private_zone" {
    name = var.private_zone_name
    comment ="created for ${local.workspace["name"]}"

    vpc {
        vpc_id = aws_vpc.vpc.id
    }
}

resource "aws_route53_record" "student_public_records" {
    count   =  var.student_instance_count
    zone_id =  aws_route53_zone.aws_sub_zone.zone_id
    name    = "${var.student_prefix}${format("%02d", count.index)}"
    type    = "A"
    ttl     = "30"
    records = [aws_eip.student_eip[count.index].public_ip]
}

resource "aws_route53_record" "student_private_records" {
    count   = var.student_instance_count
    zone_id = aws_route53_zone.private_zone.zone_id
    name    = "${var.student_private_zone_record_prefix}${format("%02d", count.index)}"
    type    = "A"
    ttl     = "30"
    records = [aws_instance.student_instance[count.index].private_ip]
}


resource "aws_route53_record" "publisher_public_records" {
    count = var.csw_publisher ? 1 : 0
    zone_id = aws_route53_zone.aws_sub_zone.zone_id
    name    = "publisher"
    type    = "A"
    ttl     = "30"
    records = [aws_eip.publisher_eip[0].public_ip]
}

resource "aws_route53_record" "publisher_private_records" {
    count = var.csw_publisher ? 1 : 0
    zone_id = aws_route53_zone.private_zone.zone_id
    name    = "publisher"
    type    = "A"
    ttl     = "30"
    records = [aws_instance.publisher_instance[0].private_ip]
}
resource "aws_route53_record" "webserver_private_record" {
    zone_id = aws_route53_zone.private_zone.zone_id
    name    = "webserver"
    type    = "A"
    ttl     = "30"
    records = [aws_instance.webserver_instance.private_ip]
}
resource "aws_route53_record" "guacamole_public_record" {
    zone_id = aws_route53_zone.aws_sub_zone.zone_id
    name    = "guacamole"
    type    = "A"
    ttl     = "30"
    records = [aws_eip.guacamole_instance_eip.public_ip]
}
resource "aws_route53_record" "guacamole_private_record" {
    zone_id = aws_route53_zone.private_zone.zone_id
    name    = "guacamole"
    type    = "A"
    ttl     = "30"
    records = [aws_instance.guacamole_instance.private_ip]
}
resource "aws_route53_record" "master_public_record" {
    zone_id = aws_route53_zone.aws_sub_zone.zone_id
    name    = "master"
    type    = "A"
    ttl     = "30"
    records = [aws_eip.master_instance_eip.public_ip]
}
resource "aws_route53_record" "master_private_record" {
    zone_id = aws_route53_zone.private_zone.zone_id
    name    = "master"
    type    = "A"
    ttl     = "30"
    records = [aws_instance.master_instance.private_ip]
}

# create AWS SUBZONE 

resource "aws_route53_zone" "aws_sub_zone" {
  name = "${local.workspace["namespace"]}.${var.hosted-zone}"
  comment = "Managed by Terraform, Delegated Sub Zone for AWS for ${local.workspace["namespace"]}"

}

data "aws_route53_zone" "main" {
  name = var.hosted-zone
}

resource "aws_route53_record" "aws_sub_zone_ns" {
  zone_id = "${data.aws_route53_zone.main.zone_id}"
  name    = "${local.workspace["namespace"]}.${var.hosted-zone}"
  type    = "NS"
  ttl     = "30"

  records = [
    for awsns in aws_route53_zone.aws_sub_zone.name_servers:
    awsns
  ]
}

# Für den Fall des neuen UBUNTU Publishers mit Token

resource "aws_route53_record" "ubuntu_publisher_public_records" {
    count = var.ubuntu_publisher ? 1 : 0
    zone_id = aws_route53_zone.aws_sub_zone.zone_id
    name    = "publisher"
    type    = "A"
    ttl     = "30"
    records = [aws_eip.ubuntu_publisher_eip[0].public_ip]
}

resource "aws_route53_record" "ubuntu_publisher_private_records" {
    count = var.ubuntu_publisher ? 1 : 0
    zone_id = aws_route53_zone.private_zone.zone_id
    name    = "publisher"
    type    = "A"
    ttl     = "30"
    records = [aws_instance.ubuntu_publisher_instance[0].private_ip]
}
