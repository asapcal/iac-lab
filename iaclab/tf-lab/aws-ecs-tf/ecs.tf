# Define the AWS provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

##  Set up a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

##  Create a Subnet
resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
}

##  Create a Security Group
resource "aws_security_group" "example" {
  vpc_id = aws_vpc.example.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

##  Create ECS Cluster
resource "aws_ecs_cluster" "example" {
  name = "example-ecs-cluster"
}

## Task Definition
resource "aws_ecs_task_definition" "example" {
  family                = "example"
  container_definitions = <<DEFINITION
[
  {
    "name": "example",
    "image": "busybox",
    "cpu": 10,
    "memory": 256,
    "essential": true,
    "networkMode": "bridge"
  }
]
DEFINITION
}

## ECS Service Definition

resource "aws_ecs_service" "example" {
  name            = "example"
  cluster         = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.example.family
  desired_count   = 1
  launch_type     = "EC2"
}

# Output ECS cluster details
output "aws_ecs_cluster_arn" {
  description = "The ARN of the ECS cluster"
  value       = aws_ecs_cluster.example.arn
}
