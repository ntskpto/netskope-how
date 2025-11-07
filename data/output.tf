output "student_public_dns" {
  value = aws_route53_record.student_public_records.*.fqdn
}

output "publisher_public_dns" {
  value = aws_route53_record.publisher_public_records.*.fqdn
}


output "ubuntu_publisher_public_dns" {
  value = aws_route53_record.publisher_public_records.*.fqdn
}

output "guacamole_public_dns" {
  value = aws_route53_record.guacamole_public_record.fqdn
}

# output "master_public_dns" {
#   value = aws_route53_record.master_public_record.fqdn
# }

