resource "aws_glue_security_configuration" "glue_security_configurations" {
  for_each = var.glue_security_configurations

  name   = each.value.name
  region = each.value.region

  encryption_configuration {
    cloudwatch_encryption {
      cloudwatch_encryption_mode = each.value.encryption_configuration.cloudwatch_encryption.cloudwatch_encryption_mode
      kms_key_arn                = each.value.encryption_configuration.cloudwatch_encryption.kms_key_arn
    }
    job_bookmarks_encryption {
      job_bookmarks_encryption_mode = each.value.encryption_configuration.job_bookmarks_encryption.job_bookmarks_encryption_mode
      kms_key_arn                   = each.value.encryption_configuration.job_bookmarks_encryption.kms_key_arn
    }
    s3_encryption {
      kms_key_arn        = each.value.encryption_configuration.s3_encryption.kms_key_arn
      s3_encryption_mode = each.value.encryption_configuration.s3_encryption.s3_encryption_mode
    }
  }
}

