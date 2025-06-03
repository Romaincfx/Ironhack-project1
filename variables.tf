# variables.tf

variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-west-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed"
  type        = string
  default     = "vpc-01451be1500c3dc4d"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.11.0/24"]
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-1a", "us-west-1c"]
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-04f7a54071e74f488"
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "backend_bucket" {
  description = "Name of the S3 bucket to store remote state"
  type        = string
  default     = "my-terraform-state-bucket"
}

variable "backend_key" {
  description = "Path to the state file inside the bucket"
  type        = string
  default     = "infra/terraform.tfstate"
}

variable "lock_table" {
  description = "DynamoDB table name for state locking"
  type        = string
  default     = "romain-terraform-locks"
}

variable "user_data_docker" {
  description = "User data script to install Docker"
  type        = string
  default     = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    usermod -aG docker ec2-user
    systemctl enable docker
  EOF
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = "frontend-tg"
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol for the target group"
  type        = string
  default     = "HTTP"
}

variable "target_group_health_check_path" {
  description = "Path for the target group health check"
  type        = string
  default     = "/"
}

variable "target_group_health_check_protocol" {
  description = "Protocol for the target group health check"
  type        = string
  default     = "HTTP"
}

variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key"
  type        = string
}
