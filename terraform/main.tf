module "vpc_module" {
  source = "vpc"
  azs    = "${var.azs}"
}

module "k8s" {
  source     = "k8s"
  aws_region = "${var.region}"
}
