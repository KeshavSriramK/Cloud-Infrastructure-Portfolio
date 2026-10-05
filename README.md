# Cloud Infrastructure Portfolio

A production-grade collection of cloud architecture, infrastructure-as-code (IaC), serverless automation, and DevOps projects built using **Terraform**, **AWS**, and **Python**. 

Each project folder operates as an independent module adhering to enterprise security best practices, high availability design patterns, and least-privilege access control.

---

## 📂 Project Directory

A curated collection of production-grade cloud infrastructure projects showcasing Terraform, AWS automation, networking, and serverless architectures.

| Project # | Project Name | Description | Tech Stack |
| :---: | :--- | :--- | :--- |
| **01** | [VPC EC2 Apache Web Server](./01-vpc-ec2-apache-webserver) | Custom VPC configuration, public subnets, security groups, and automated EC2 Apache deployment via user_data. | AWS (VPC, EC2, IAM), Terraform |
| **02** | [Uptime Viking Game Server](./02-uptime-viking-game-server) | Secure game server containerized with Docker behind an Nginx reverse proxy, automated Let's Encrypt SSL/TLS certificates, and a serverless Python Discord monitoring daemon. | AWS (EC2, SSM, IAM), Docker, Nginx, Python |
| **03** | [AWS Automated Infrastructure](./03-aws-automated-infrastructure) | Automated end-to-end Terraform deployment of a secure VPC, Apache web server instance, and private S3 bucket with strict access controls. | AWS (VPC, EC2, S3), Terraform, Bash |
| **04** | [Global Secret Santa Matcher (Upcoming)](#) | Serverless event-driven architecture using API Gateway, AWS Lambda (Python), EventBridge, DynamoDB, and Amazon SES for automated alerting. | AWS (Lambda, API Gateway, DynamoDB, SES) |
| **05** | [Secure S3 Static Website & CloudFront (Upcoming)](#) | Enterprise static website hosting with a private S3 bucket locked behind CloudFront OAC, Route 53 DNS routing, and ACM SSL certificates. | AWS (S3, CloudFront, Route 53, ACM) |
| **06** | [High Availability 3-Tier Web App (Upcoming)](#) | Fault-tolerant architecture spanning private subnets across multiple AZs, an Application Load Balancer (ALB) with SSL termination, and an Auto Scaling Group (ASG). | AWS (ALB, ASG, VPC, EC2) |
| **07** | [Automated Cost-Killer & Security Auditor (Upcoming)](#) | FinOps governance script running on an EventBridge cron schedule via Lambda to scan and prune unattached EBS volumes and idle cloud resources. | AWS (Lambda, EventBridge, IAM), Python |

---

## 🛡️ Engineering Standards & Design Principles

* **Modular IaC:** Every project maintains a clean, decoupled state configuration to ensure isolated deployments and zero cross-project contamination.
* **Security-First Approach:** Strict enforcement of least-privilege IAM roles, encrypted secrets management (AWS SSM Parameter Store / Secrets Manager), and zero open administrative ports (SSH managed strictly via AWS SSM Session Manager).
* **Automation & Reliability:** Integration of automated bootstrapping configurations, robust monitoring daemons, and cloud-native event-driven pipelines.
