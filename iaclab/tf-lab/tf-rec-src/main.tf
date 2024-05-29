# main.tf

provider "aws" {
  region = "us-east-1"
  profile = "default"
}
resource "aws_s3_bucket" "my_bucket" {
  bucket  = "you-unique-bucket-name"
  force_destroy = true
  tags    = {
	Name          = "mys3bucket"
	Environment    = "test"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "labs-key"
  public_key = "our-public-key"
}

output "key_name" {
  value = aws_key_pair.deployer.key_name
}

