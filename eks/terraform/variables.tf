variable "cluster-name" {
  default = "terraform-eks"
  type    = "string"
}
variable "my_pub_ip" {
  type = "string"
  default = "156.34.161.141/32"
}
variable "vpc_id" {
  default = "vpc-d68778be"
}

data "aws_vpc" "default" {
  id = "${var.vpc_id}"
}
data "aws_region" "current" {}

data "aws_subnet_ids" "default" {
  vpc_id = "${var.vpc_id}"
}

data "aws_subnet" "default" {
  id = "${data.aws_subnet_ids.default.ids[count.index]}"
  count = "${length(data.aws_subnet_ids.default.ids)}"
}

data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon Account ID
}

