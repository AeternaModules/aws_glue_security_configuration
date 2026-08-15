output "glue_security_configurations_id" {
  description = "Map of id values across all glue_security_configurations, keyed the same as var.glue_security_configurations"
  value       = { for k, v in aws_glue_security_configuration.glue_security_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "glue_security_configurations_encryption_configuration" {
  description = "Map of encryption_configuration values across all glue_security_configurations, keyed the same as var.glue_security_configurations"
  value       = { for k, v in aws_glue_security_configuration.glue_security_configurations : k => one(v.encryption_configuration) if v.encryption_configuration != null && length(v.encryption_configuration) > 0 }
}
output "glue_security_configurations_name" {
  description = "Map of name values across all glue_security_configurations, keyed the same as var.glue_security_configurations"
  value       = { for k, v in aws_glue_security_configuration.glue_security_configurations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "glue_security_configurations_region" {
  description = "Map of region values across all glue_security_configurations, keyed the same as var.glue_security_configurations"
  value       = { for k, v in aws_glue_security_configuration.glue_security_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}

