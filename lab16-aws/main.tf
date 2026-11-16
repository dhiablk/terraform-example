resource "random_string" "suffix" {
  length  = var.random_suffix_length
  special = var.special_chars_allowed
  upper   = var.upper_chars_allowed
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.prefix}-example-${random_string.suffix.result}"

  tags = {
    Name        = var.bucket_tag_name
    Environment = var.environment
    Lab         = var.lab_name
  }
}

resource "aws_iam_role" "example" {
  name = "${var.prefix}-example-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = var.effect_type
        Principal = {
          Service = var.assume_role_service
        }
      }
    ]
  })

  tags = {
    Lab         = var.lab_name
    Environment = var.environment
  }
}

resource "aws_iam_policy" "example" {
  name        = "${var.prefix}-example-policy"
  description = "${var.policy_description} for ${var.lab_name}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.policy_actions
        Effect   = var.effect_type
        Resource = aws_s3_bucket.example.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "example" {
  role       = aws_iam_role.example.name
  policy_arn = aws_iam_policy.example.arn
}