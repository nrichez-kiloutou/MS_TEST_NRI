# kil-dev-s3-nri-v1-data

# S3 BUCKET
# !!! ATTENTION !!! - RENAME = SUPPRESSION DES DONNEES
resource "aws_s3_bucket" "ms_test_nri_v1_s3_bucket" {
  bucket        = lower(format("kil-%s-s3-%s-%s-data", terraform.workspace, var.product_trigram, var.product_version))
  acl           = "private"
  force_destroy = terraform.workspace == "prd" ? false : true
  tags          = var.default_tags
}

resource "aws_s3_bucket_public_access_block" "ms_test_nri_v1_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.ms_test_nri_v1_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
