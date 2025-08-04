# Terraform Learning Project

This repository contains Terraform scripts for learning and testing AWS Infrastructure as Code (IaC) practices.

## Features

- Launch and configure EC2 instances
- Manage Security Groups
- Learn and apply key Terraform commands:
  - `init`, `plan`, `apply`, `destroy`
  - `refresh`, `state list`, `state show`, `state rm`, `import`
- Use conditional statements in resources and modules
- Implement remote backend with:
  - **S3** for storing Terraform state files
  - **DynamoDB** for state locking and consistency

## Requirements

- Terraform >= 1.5
- AWS CLI configured with access key and secret
- Git installed and configured
- AWS resources setup:
  - S3 bucket for state file storage
  - DynamoDB table for state locking

## Getting Started

```bash
terraform init
terraform plan
terraform apply
terraform refresh
terraform state list
terraform state show <resource_name>
terraform state rm <resource_name>
terraform import <resource_name> <real-world-id>
