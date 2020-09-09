data "aws_iam_policy_document" "aws_bucket_policy"{
    statement {
        sid = "DenyPublicReadACL"
        effect = "Deny"
        principals {
            type = "AWS"
            identifiers = ["*"]
        }
        actions = [
            "s3:PutObject",
            "s3:PutObjectAcl"
        ]
        resources = ["arn:aws:s3:::${var.dlBucketId}/*"]
        condition {
            test = "StringEquals"
            variable = "s3:x-amz-acl"
            values = [
                "public-read",
                "public-read-write",
                "authenticated-read"
            ]
        }
    }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
    bucket = var.dlBucketId
    policy = data.aws_iam_policy_document.aws_bucket_policy.json
}
