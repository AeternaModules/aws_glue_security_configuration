variable "glue_security_configurations" {
  description = <<EOT
Map of glue_security_configurations, attributes below
Required:
    - name
    - encryption_configuration (block):
        - cloudwatch_encryption (required, block):
            - cloudwatch_encryption_mode (optional)
            - kms_key_arn (optional)
        - job_bookmarks_encryption (required, block):
            - job_bookmarks_encryption_mode (optional)
            - kms_key_arn (optional)
        - s3_encryption (required, block):
            - kms_key_arn (optional)
            - s3_encryption_mode (optional)
Optional:
    - region
EOT

  type = map(object({
    name   = string
    region = optional(string)
    encryption_configuration = object({
      cloudwatch_encryption = object({
        cloudwatch_encryption_mode = optional(string)
        kms_key_arn                = optional(string)
      })
      job_bookmarks_encryption = object({
        job_bookmarks_encryption_mode = optional(string)
        kms_key_arn                   = optional(string)
      })
      s3_encryption = object({
        kms_key_arn        = optional(string)
        s3_encryption_mode = optional(string)
      })
    })
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

