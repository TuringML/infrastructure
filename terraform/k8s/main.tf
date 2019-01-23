module "kubernetes" {
  source = "scholzj/kubernetes/aws"

  aws_region           = "${var.aws_region}"
  cluster_name         = "${terraform.workspace}-kubernetes"
  master_instance_type = "t2.medium"
  worker_instance_type = "t2.medium"
  min_worker_count     = 3
  max_worker_count     = 6
  hosted_zone          = "my-domain.com"

  master_subnet_id = "${var.private_subnet_id}"

  worker_subnet_ids = ["${var.private_subnets}"]

  # Tags
  tags = {
    Application = "AWS-Kubernetes"
  }

  # Tags in a different format for Auto Scaling Group
  tags2 = [
    {
      key                 = "Application"
      value               = "${terraform.workspace}-kubernetes"
      propagate_at_launch = true
    },
  ]

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-kubernetes/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-kubernetes/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-kubernetes/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-kubernetes/master/addons/external-dns.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-kubernetes/master/addons/autoscaler.yaml",
  ]
}
