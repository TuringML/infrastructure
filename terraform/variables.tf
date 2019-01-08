variable "region" {
  type    = "string"
  default = "eu-west-1"
}

variable "azs" {
  type    = "list"
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}
