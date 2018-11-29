data "aws_caller_identity" "current" {}

terraform {
    backend "s3" {
        encrypt = true
        bucket = "${data.aws_caller_identity.current.account_id}-tf-state"
        dynamodb_table = "terraform-state-lock-dynamo-${data.aws_caller_identity.current.account_id}"
        region = "us-east-1"
        key = "${data.aws_caller_identity.current.account_id}/"
    }
}