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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5qTma+tPF9p6pnMybZaqk+f+u5sCpCN5WoS0pYl7+ucuVuDSFbGD/+WM4Q2KzbrEVSRicnw2piFc10vjDL0ALx2IeoAHIduNzo8X/AW33vgNlGTTfint7DZlrlHbu4ReprePgxOcNy3Fr67UODerkF0wJj0ITsR7HPOeUGxOLqdSAAjm8y/10AEnn9w8+X8IuLNsoBFrxZ/4F5ubg/1cDVLP43kNnZCoDfON0ULOB1+R8VathxtkDLJJ27MWRbmaXgeaXOi0xVAxZ5NLU7iiMWcjFSn5E/XlVSfXjjWF9R6T9qlPmojjhM4tyGRmstbSZupj7lQx4hbdYxVPaV8AB ubuntu@ip-172-31-26-52"

}