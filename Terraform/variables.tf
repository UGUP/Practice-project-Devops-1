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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCUGZNnAiD1TNUHomURnjj/s3JD2eTj6c1e/pJE3urZ3+53LB92WAwJv28daUjJILYh0ba6DlgJ766+38jpl6xFxwyvE3x+cJM3IHx8uOpNie9tWvvgavKd/qWv3HyUAOFExhJWYW9ffVyR6QCwVd0Gq3QzIY/01t+tZd6mg0b+e6QN/OcCvKCeiyFlBMFmBwDYbOzvJHMiTxvsJBOZRc7SXm6akOsrw18GU4KYf5VtmiSnuLCgm8DGnZkZBPEfPU/uDglR9RfaM/8E7cqBJmk40PLKmk4Se+7Jm80jS2MoFNOMJSPcdF8iczd/G77wHVcHQaO53FZNQJ2MJptlYSZ ubuntu@ip-172-31-26-52"
}