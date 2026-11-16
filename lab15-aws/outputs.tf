output "vpc_id" {
  description = "ID of the custom VPC"
  value       = module.custom_vpc.vpc_id
}

output "subnet_ids" {
  description = "IDs of custom subnets"
  value       = module.custom_vpc.subnet_ids
}

output "instance_id" {
  description = "ID of the custom EC2 instance"
  value       = module.custom_ec2.instance_id
}

output "instance_private_ip" {
  description = "Private IP of the custom EC2 instance"
  value       = module.custom_ec2.instance_private_ip
}

output "security_group_id" {
  description = "ID of the custom security group"
  value       = module.custom_ec2.security_group_id
}