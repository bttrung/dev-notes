variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION_SINGAPORE" {}
variable "AWS_REGION_HONGKONG" {}

variable "AMIS" {
  type = map
  default = {
    ap-southeast-1 : "ami-0ccbe0d11813b32c0" # Singapore
    ap-east-1 : "ami-0e4edb3648cd12c6b" # Hongkong
  }
}
