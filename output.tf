output "student_public_dns" {
  value = aws_route53_record.student_public_records.*.fqdn
}

output "publisher_public_dns" {
  value = aws_route53_record.publisher_public_records.*.fqdn
}


output "ubuntu_publisher_public_dns" {
  value = aws_route53_record.publisher_public_records.*.fqdn
}

# output "webserver_private_dns" {
#   value = aws_route53_record.webserver_private_record.fqdn
# }

# output "guacamole_private_dns" {
#   value = aws_route53_record.guacamole_private_record.fqdn
# }

output "guacamole_public_dns" {
  value = aws_route53_record.guacamole_public_record.fqdn
}

# output userdata {
#   value = "\n${data.template_cloudinit_config.userdata.rendered}"
# }


# output userdata_file {
#   value = "\n${data.template_file.userdata.rendered}"
# }