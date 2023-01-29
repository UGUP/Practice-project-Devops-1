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
  default = "106.196.103.143"
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6zYkTvLSAym/Te8FHtjIxrBnxwKAcOBtcowg0z/fisigMi5KlaVRGM6p9HCWYzFTiV8pxhN0+EeDbiJfmwk5IrrTMpJZFuPRCix5OaJh4UIjS7jTRv3p/mnGLvjUXLUU1u/T2JH5vuuPJO1d4O+dtjG1+AmumLKcbDhXfYjvHzsjqWPNqcgoO+K9d8vLsG2TaRGYJ3bc55XokTsTr/0mU2iJ5ZC/jScFBbaPx91Z31My+qCvmsF67cUT3FJ43y7pqslyMBw97P64L1UjR+cuso3D9D2jVLoVxj9OFy81M6fzkATaM+sgH3fuYEo0nwq3R6LHURDE+MFpnoIH75F1F ubuntu@ip-172-31-26-52"

}