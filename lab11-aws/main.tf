resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "primary" {
  provider = aws.primary
  bucket   = "primary-${var.environment}-${random_string.suffix.result}"

  tags = {
    Name        = "Primary Region Bucket"
    Environment = var.environment
    Region      = var.primary_region
  }
}

resource "aws_s3_bucket" "secondary" {
  provider = aws.secondary
  bucket   = "secondary-${var.environment}-${random_string.suffix.result}"

  tags = {
    Name        = "Secondary Region Bucket"
    Environment = var.environment
    Region      = var.secondary_region
  }
}