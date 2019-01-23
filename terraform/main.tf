module "vpc_module" {
  source = "vpc"
  azs    = "${var.azs}"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${terraform.workspace}-eks-cluster"
  subnets         = "${module.vpc_module.public_subnets}"
  manage_aws_auth = true
  cluster_version = "1.11"

  worker_groups = [
    {
      instance_type        = "m4.large"
      asg_desired_capacity = 2
      asg_min_size         = 2
      asg_max_size         = 4
    },
  ]

  tags = {
    Environment = "${terraform.workspace}"
  }

  vpc_id = "${module.vpc_module.vpc_id}"
}
