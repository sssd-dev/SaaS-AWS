terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "753182529116-tf-state"
    dynamodb_table = "terraform-state-lock-dynamo-753182529116"
    region         = "us-east-1"
    key            = "753182529116/"
    kms_key_id     = "787ce905-97f8-4d96-a5cb-b416c571a073"
  }
}
