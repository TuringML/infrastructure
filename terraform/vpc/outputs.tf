output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc.public_subnets}"]
}

output "public_subnet_id" {
  description = "Single ID of public subnet"
  value       = "element(${module.vpc.public_subnets}, 0)"
}
