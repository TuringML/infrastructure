data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "state-tf-rtl"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
