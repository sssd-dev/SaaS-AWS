variable "cluster-name" {
  default = "terraform-eks"
  type    = "string"
}

variable "vpc_id" {
  default = "vpc-98c363e1"
  type    = "string"
}

data "aws_vpc" "default" {
  id = "${var.vpc_id}"
}

# data "aws_subnet" "default" {
#   vpc_id = "vpc-98c363e1"
# }

