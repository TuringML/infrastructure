terraform {
  backend "s3" {
    bucket               = "state-tf-rtl"
    key                  = "terraform.tfstate"
    region               = "eu-west-1"
    workspace_key_prefix = "rtl-group"
  }
}
