# ACM Module - To create and Verify SSL Certificates
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.2"

  domain_name = trimsuffix(data.aws_route53_zone.mydomain.name, ".") // in general the internal domain ends with "." like sakthimakil.com. so to remove "." in suffix, we need this function
  zone_id     = data.aws_route53_zone.mydomain.zone_id
  subject_alternative_names = [
    var.dns_name
  ]

  wait_for_validation = true
  tags                = local.common_tags
}

# Output ACM Certificate ARN
output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}
