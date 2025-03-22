# 🌍 Deploying a 2-Tier Application on AWS using Terraform

This repository guides you through setting up a **2-tier application** on AWS Cloud using Terraform.

## 🏛 Architecture Overview

![Architecture diagram](https://github.com/AnkitJodhani/3rdWeekofCloudOps/blob/main/architecture.gif)

## ⚡ Prerequisites

Before getting started, ensure you have:
- Installed Terraform ([Guide](https://ankitjodhani.hashnode.dev/implementing-two-tier-architecture-in-aws-with-terraform-step-by-step-guide-10weeksofcloudops))
- Configured AWS CLI
- Basic understanding of Terraform and AWS services

## ⚙️ Environment Setup

### 1️⃣ Create an S3 Bucket for State Management
To store Terraform state remotely:
```sh
aws s3 mb s3://YOUR_BUCKET_NAME
```
🔹 **Enable versioning** for safe state recovery.

### 2️⃣ Configure DynamoDB for Locking
Create a table to manage state locks:
- Table Name: **Your choice**
- Partition Key: `LockID` (String)

### 3️⃣ Generate SSH Key Pair
To securely access instances:
```sh
cd modules/key/
ssh-keygen -t rsa -b 4096 -f client_key
```
Modify Terraform configurations to use the correct key name.

### 4️⃣ Set Up Terraform Backend
Edit `backend.tf` and configure:
```hcl
terraform {
  backend "s3" {
    bucket         = "BUCKET_NAME"
    key            = "backend/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "DYNAMODB_TABLE_NAME"
  }
}
```

## 🔨 Configuring Variables
Create a `terraform.tfvars` file:
```sh
vim root/terraform.tfvars
```

Define your variables:
```hcl
region                  = "us-east-1"
project_name            = "my_project"
vpc_cidr                = "10.0.0.0/16"
pub_sub_1a_cidr         = "10.0.1.0/24"
pub_sub_2b_cidr         = "10.0.2.0/24"
pri_sub_3a_cidr         = "10.0.3.0/24"
pri_sub_4b_cidr         = "10.0.4.0/24"
db_username             = "admin"
db_password             = "your_secure_password"
certificate_domain_name = "yourdomain.com"
additional_domain_name  = "sub.yourdomain.com"
```

## 🔐 AWS Service Configurations
### AWS Certificate Manager (ACM)
- Ensure a valid **issued** certificate is available.

### Route 53 Hosted Zone
- Verify a **public hosted zone** exists in AWS Route 53.

## 🚀 Deploying the Infrastructure

Navigate to the project directory:
```sh
cd root
```

### Initialize Terraform
```sh
terraform init
```

### Check Execution Plan
```sh
terraform plan
```

### Deploy Resources
```sh
terraform apply
```
Type `yes` when prompted.

## 🎉 Success!
Your 2-tier application is now live on AWS! 🚀
For Refernce : https://youtu.be/s8q5B6DLH7s?si=rfxv0C7R1FbQwoyR 
