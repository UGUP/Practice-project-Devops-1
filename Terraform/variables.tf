variable "VPC"{
    default = "10.0.0.0/16"
}

variable "public-subnet1" {
  default="10.0.101.0/24"
}

variable "public-subnet2" {
  default="10.0.102.0/24"
}

variable "private-subnet1" {
  default="10.0.1.0/24"
}

variable "private-subnet2" {
  default = "10.0.2.0/24"
}

variable "ami" {
  default = "ami-0778521d914d23bc1"
}
  
variable "instance_type" {
  default="t2.medium"
}

variable "key_name" {
  default = "test2"
}

variable "bits" {
  default=32
}


