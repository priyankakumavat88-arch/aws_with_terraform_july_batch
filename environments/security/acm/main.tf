module "acm_module" {
  source      = "../../../modules/security/ACM"
  aws_region  = var.aws_region
  domain_name = var.domain_name
}
