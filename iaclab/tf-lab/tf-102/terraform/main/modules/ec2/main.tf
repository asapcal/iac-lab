resource "aws_instance" "webserver" {
  ami           = var.ami_id
  instance_type = var.instance_type

  key_name        = var.key_name
  subnet_id       = var.public_subnet_id
  security_groups = [var.security_group_id]

  # Configuração para tornar a instância acessível através do Elastic IP
  associate_public_ip_address = true

  tags = {
    Name = "WebServer"
  }

  user_data = <<-EOF
              #!/bin/bash
                apt-get update -y
                apt-get install nginx -y
                systemctl start nginx
                systemctl enable nginx
                echo "<h1>Deployado via Terraform com o Gomex e o Jeferson</h1>" > /var/www/html/index.html
                EOF
}


resource "aws_key_pair" "labs-key-giropops" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCP9kr2dvt7D85wth+DAqONZuUP8wQlxaN3PoHlF4qH+t4rt0wWLAEvK1UfvnraXssUl6Vog6w9htR6NfnjQdjfwx0fEYKb7Hk07bL0/PN2Z2z7/lLaImVIgrbuT6PJqdil443bls0Toy9JyNa8kHdPqTwXSj1//I2lN6n4Yfq9oZwjODdZwdxECyAUuOAbXopogtd+6+6VwL+xBq7rug2/zAhCAXf0SftpTBXMVFSHtDF25HVtw1q6C6932Ix1iHVNhl1kiXs1oAxGD7KcAfIOT7FwVCgz2Kh5oRSOFuC1GJOvAuf8LvBDInAHLvDpT1ZDKYU+3c+8Q4SVsUfNl7wj"
}

