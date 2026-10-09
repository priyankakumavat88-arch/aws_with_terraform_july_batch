module "s3_module" {
  source      = "../../../../modules/Storage/S3"
  bucket_name = var.bucket_name
  environment = var.environment
}

module "cdn_module" {
  source = "../../../../modules/Storage/CDN"

  aws_region  = var.aws_region
  bucket_name = module.s3_module.bucket_name
  bucket_arn  = module.s3_module.bucket_arn

  bucket_regional_domain_name = module.s3_module.bucket_regional_domain_name

  aliases = [
    var.frontend_domain
  ]

  #acm_certificate_arn = "arn:aws:acm:us-east-1:947317651822:certificate/916c1367-d69c-45af-bb6c-19a6a392a9f4"
  acm_certificate_arn = "arn:aws:acm:us-east-1:947317651822:certificate/874d4166-1e29-4a59-90b6-446815e62d05"

  environment = var.environment
}

resource "aws_route53_record" "frontend" {

  zone_id = data.terraform_remote_state.dns.outputs.hosted_zone_id

  name = var.frontend_domain

  type = "A"

  alias {

    name = module.cdn_module.distribution_domain_name

    zone_id = module.cdn_module.hosted_zone_id

    evaluate_target_health = false

  }

}
