output "bastion_public_ip" {
  description = "Public IP of the bastion host"
  value       = module.compute.bastion_public_ip
}

output "private_instance_id" {
  description = "ID of the private EC2 instance"
  value       = module.compute.private_instance_id
}
