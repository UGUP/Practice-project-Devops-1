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
  default = "AS2key"
}

variable "bits" {
  default=32
}

variable "my_ip" {
  type = string
  default = "103.66.208.91"
}

variable "public_key" {
  default ="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCdfj5d/GPQWpT3lFOpr5+ATlekViph1lyQP9LYqH6SiJSEd6j5jU6EgrO8Xv44nKttcBnheVly3x8EF30Lun1cZpbZFdjiUA8DafMhDnenUocnb+fCiqadZIUeOvi8sGfE2ksDsQAt5NUmmSWP4OKpXiGI1lEdbKW6K/dP9GjDjKnUYff+68rrVcZB8+YvEf4Qs6bBMXAeaq7h4nrNAXUdxCFY8NasFVfncpFMgRsijy7XoOCrBkCPhJ+K0bfpnwAhfKVp95c28uFUuw+mESk8SBpnSODRPZNgCfXav1nqF5d0m888UZiSVLyC7M76CmW4737U5EAWb+8ERkl1toZ ubuntu@ip-172-31-26-52"
}