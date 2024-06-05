variable "instance_type" {
  description = "The type of EC2 instance to use."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name of the AWS Key Pair to be used for the EC2 instance."
  type        = string
  default     = "labs-key-giropops"
}

variable "ami_id" {
  description = "The AMI ID to be used for the EC2 instance."
  type        = string
  default     = "ami-00beae93a2d981137"
}

variable "public_key" {
  description = "The public key to be used for the AWS Key Pair."
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCP9kr2dvt7D85wth+DAqONZuUP8wQlxaN3PoHlF4qH+t4rt0wWLAEvK1UfvnraXssUl6Vog6w9htR6NfnjQdjfwx0fEYKb7Hk07bL0/PN2Z2z7/lLaImVIgrbuT6PJqdil443bls0Toy9JyNa8kHdPqTwXSj1//I2lN6n4Yfq9oZwjODdZwdxECyAUuOAbXopogtd+6+6VwL+xBq7rug2/zAhCAXf0SftpTBXMVFSHtDF25HVtw1q6C6932Ix1iHVNhl1kiXs1oAxGD7KcAfIOT7FwVCgz2Kh5oRSOFuC1GJOvAuf8LvBDInAHLvDpT1ZDKYU+3c+8Q4SVsUfNl7wj"
}
