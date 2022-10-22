
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.36"
    }
  }
}

# certificate should be made in us-east-1 for use with cloudfront
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
  default_tags {
    tags = {
      Project = var.project_name
    }
  }
}

# project will be hosted us-west-2
provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      Project = var.project_name
    }
  }
}