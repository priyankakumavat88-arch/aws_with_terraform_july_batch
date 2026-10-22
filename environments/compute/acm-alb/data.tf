
data "terraform_remote_state" "dns_backend" {
  backend = "s3"

  config = {
    bucket = "terraform-remote-backend-priya"
    key    = "global/dns/priwave/terraform.tfstate"
    region = "ap-south-1"
  }
}
