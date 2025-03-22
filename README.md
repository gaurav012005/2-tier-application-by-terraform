# 2-tier-application-by-terraform

# 🚀 Challenge 3 - 2-Tier Application Deployment using Terraform (Part of #10WeeksOfCloudOps)

This repository is dedicated to learning and deploying a **2-tier application** on AWS Cloud using Terraform.

## 🎥 Learn Visually

If you're a visual learner, check out this video tutorial:
[![2-tier Architecture using Terraform](https://img.youtube.com/vi/s8q5B6DLH7s/sddefault.jpg)](https://youtu.be/s8q5B6DLH7s)

## 🏗 Architecture Overview

![Architecture diagram](https://github.com/AnkitJodhani/3rdWeekofCloudOps/blob/main/architecture.gif)

[Image Source: Ankit Jodhani](https://github.com/AnkitJodhani/3rdWeekofCloudOps/blob/main/architecture.gif)

## 🛠 Prerequisites

To set up and deploy this infrastructure, ensure you have:
- Terraform installed ([Installation Guide](https://ankitjodhani.hashnode.dev/implementing-two-tier-architecture-in-aws-with-terraform-step-by-step-guide-10weeksofcloudops))
- AWS CLI configured
- Basic knowledge of Terraform and AWS services

## 📌 Setting Up the Environment

### 1️⃣ Create an S3 Bucket for Terraform State Storage
To store Terraform state files remotely, create an S3 bucket:
```sh
aws s3 mb s3://YOUR_BUCKET_NAME
```
✅ **Enable bucket versioning** to recover previous states if needed.

### 2️⃣ Configure DynamoDB for State Locking
Create a DynamoDB table for Terraform state locking:
- Table Name: **Your choice**
- Partition Key: `LockID` (String type)

### 3️⃣ Generate an SSH Key Pair
To securely access instances, generate a key pair:
```sh
cd modules/key/
ssh-keygen -t rsa -b 4096 -f client_key
```
Modify Terraform files to use the correct key name.

### 4️⃣ Configure Terraform Backend
Edit `backend.tf` with your S3 bucket and DynamoDB details:
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

## 🔧 Configuring Variables
Create a `terraform.tfvars` file to store your infrastructure variables:
```sh
vim root/terraform.tfvars
```

Add the required variables:
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

## 🔐 Setting Up AWS Services
### AWS Certificate Manager (ACM)
- Ensure you have a valid **issued** certificate.
- If needed, create one for your domain.

### Route 53 Hosted Zone
- Verify a **public hosted zone** exists in AWS Route 53.
- Create one if necessary.

## 🚀 Deploying the Infrastructure

Navigate to the root directory:
```sh
cd root
```

### Initialize Terraform
```sh
terraform init
```

### Preview the Execution Plan
```sh
terraform plan
```

### Deploy the Infrastructure
```sh
terraform apply
```
When prompted, type `yes` to confirm.

## ✅ Completion


