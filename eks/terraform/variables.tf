variable "cluster-name" {
  default = "terraform-eks"
  type    = "string"
}
variable "my_pub_ip" {
  type = "string"
  default = "156.34.161.141/32"
}

data "aws_vpc" "default" {
}
data "aws_region" "current" {}

data "aws_subnet" "default" {}
data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["eks-worker-*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon Account ID
}

