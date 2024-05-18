# main.tf

provider "aws" {
  region = "us-east-1"
  profile = "default"
}
resource "aws_s3_bucket" "my_bucket" {
  bucket  = "tf-backend-asap012"
  force_destroy = true
  tags    = {
	Name          = "myS3bucket"
	Environment    = "test"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "labs-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCP9kr2dvt7D85wth+DAqONZuUP8wQlxaN3PoHlF4qH+t4rt0wWLAEvK1UfvnraXssUl6Vog6w9htR6NfnjQdjfwx0fEYKb7Hk07bL0/PN2Z2z7/lLaImVIgrbuT6PJqdil443bls0Toy9JyNa8kHdPqTwXSj1//I2lN6n4Yfq9oZwjODdZwdxECyAUuOAbXopogtd+6+6VwL+xBq7rug2/zAhCAXf0SftpTBXMVFSHtDF25HVtw1q6C6932Ix1iHVNhl1kiXs1oAxGD7KcAfIOT7FwVCgz2Kh5oRSOFuC1GJOvAuf8LvBDInAHLvDpT1ZDKYU+3c+8Q4SVsUfNl7wj"
}

output "key_name" {
  value = aws_key_pair.deployer.key_name
}
