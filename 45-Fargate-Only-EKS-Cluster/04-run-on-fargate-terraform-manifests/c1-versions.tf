# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.14"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.11"
    }    
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-eks"
    key    = "dev/aws-lbc-ingress/terraform.tfstate"
    region = "ap-southeast-1" 

    # For State Locking
    dynamodb_table = "dev-aws-lbc-ingress"    
  }    
}
