# Standard Outputs
output "name" {
  description = "Name of the asset"
  value       = module.label.id
}

output "context" {
  description = "Label context"
  value       = module.label.context
}

output "enabled" {
  description = "Whether or not the module is enabled"
  value       = var.enabled
}

# Module Outputs

output "arn_role" {
  description = "arn role created"
  value       = aws_iam_role.reader_role[0].arn  
}