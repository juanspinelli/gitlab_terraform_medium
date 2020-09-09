provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

module "s3_bucket_raw" {
    source = "../modules/storage"

    entorno = "desa"
    pais = "argentina"
    tipo = "raw"
}

module "aws_s3_bucket_policy_desa_raw" {
  source = "../modules/iam"

  dlBucketId = module.s3_bucket_raw.aws_s3_bucket_id
}

module "s3_bucket_raw_structured" {
    source = "../modules/storage"

    entorno = "desa"
    pais = "argentina"
    tipo = "raw-structured"
}

module "aws_s3_bucket_policy_desa_raw_structured" {
  source = "../modules/iam"

  dlBucketId = module.s3_bucket_raw_structured.aws_s3_bucket_id
}
