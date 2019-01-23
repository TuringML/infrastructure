output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc_module.vpc_id}"
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc_module.public_subnets}"]
}
