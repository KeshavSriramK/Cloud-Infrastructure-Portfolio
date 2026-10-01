# Cloud Infrastructure Portfolio

A production-grade collection of cloud architecture, infrastructure-as-code (IaC), serverless automation, and DevOps projects built using **Terraform**, **AWS**, and **Python**. 

Each project folder operates as an independent module adhering to enterprise security best practices, high availability design patterns, and least-privilege access control.

---

## 📂 Project Directory

| # | Project Name | Architecture & Description | Key Tech Stack |
|---|---|---|---|
| **01** | [VPC & Apache Web Server](./01-vpc-ec2-apache-webserver/) | Isolated custom VPC, public subnet, Internet Gateway, security groups, and automated EC2 Apache deployment via user_data. | AWS (VPC, EC2, IAM), Terraform |
| **02** | [Uptime Viking Game Server](./02-uptime-viking-game-server/) | Secure game server containerized with Docker behind an Nginx reverse proxy, automated Let's Encrypt SSL/TLS certificates, and a serverless Python Discord monitoring daemon. | AWS (EC2, SSM, IAM), Docker, Nginx, Python |
| **03** | [Global Secret Santa Matcher](./#) *(Upcoming)* | Serverless event-driven architecture using API Gateway, AWS Lambda (Python), EventBridge, DynamoDB, and Amazon SES for automated alerting. | AWS (Lambda, API Gateway, DynamoDB, SES) |
| **04** | [Secure S3 Static Website & CloudFront](./#) *(Upcoming)* | Enterprise static website hosting with a private S3 bucket locked behind CloudFront OAC, Route 53 DNS routing, and ACM SSL certificates. | AWS (S3, CloudFront, Route 53, ACM) |
| **05** | [High Availability 3-Tier Web App](./#) *(Upcoming)* | Fault-tolerant architecture spanning private subnets across multiple AZs, an Application Load Balancer (ALB) with SSL termination, and an Auto Scaling Group (ASG). | AWS (ALB, ASG, VPC, EC2) |
| **06** | [Automated Cost-Killer & Security Auditor](./#) *(Upcoming)* | FinOps governance script running on an EventBridge cron schedule via Lambda to scan and prune unattached EBS volumes and idle cloud resources. | AWS (Lambda, EventBridge, IAM), Python |

---

## 🛡️ Engineering Standards & Design Principles

* **Modular IaC:** Every project maintains a clean, decoupled state configuration to ensure isolated deployments and zero cross-project contamination.
* **Security-First Approach:** Strict enforcement of least-privilege IAM roles, encrypted secrets management (AWS SSM Parameter Store / Secrets Manager), and zero open administrative ports (SSH managed strictly via AWS SSM Session Manager).
* **Automation & Reliability:** Integration of automated bootstrapping configurations, robust monitoring daemons, and cloud-native event-driven pipelines.
