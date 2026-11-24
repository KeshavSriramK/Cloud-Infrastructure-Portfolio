# ☁️ Cloud Infrastructure & DevOps Portfolio

> Enterprise-grade cloud automation, serverless architectures, and infrastructure-as-code built from scratch using Terraform, AWS, Docker, and Python.

---

## 🚀 Architectural Progression Roadmap

Each project in this portfolio represents a specific maturity level in cloud engineering—progressing from static storage to resilient multi-tier microservices and automated FinOps governance.

| Level / # | Project Name | Description | Core Tech Stack | Status |
| :---: | :--- | :--- | :--- | :---: |
| **Level 1** | [S3 Static Website Hosting](./level-1-s3-static-website-hosting) | Automated deployment of a static website hosted on Amazon S3 with public read bucket policies and static configuration. | `AWS S3` `Terraform` `HTML5` | 🟢 Completed |
| **Level 2** | [VPC & EC2 Apache Web Server](./level-2-vpc-ec2-apache-webserver) | Custom Virtual Private Cloud (VPC), public subnets, security groups, and automated EC2 Apache deployment via `user_data`. | `AWS VPC` `EC2` `IAM` `Terraform` | 🟢 Completed |
| **02** | [Uptime Viking Game Server](./02-uptime-viking-game-server) | Secure game server containerized with Docker behind an Nginx reverse proxy, automated Let's Encrypt SSL/TLS, and a Python Discord monitoring daemon. | `Docker` `Nginx` `SSM` `Python` | 🟢 Completed |
| **03** | [AWS Automated Infrastructure](./03-aws-automated-infrastructure) | Automated end-to-end Terraform deployment of a secure VPC, Apache web server instance, and private S3 bucket with strict access controls. | `AWS VPC` `S3` `Bash` `Terraform` | 🟢 Completed |
| **04** | [Global Secret Santa Matcher](./04-global-secret-santa-matcher) | Serverless event-driven backend using API Gateway, AWS Lambda (Python), EventBridge, DynamoDB, and Amazon SES for automated alerting. | `AWS Lambda` `API Gateway` `DynamoDB` `SES` | 🟢 Completed |
| **05** | [Secure S3 Static Website & CloudFront](./05-s3-cloudfront-static-website) | Enterprise static website hosting with a private S3 bucket locked behind CloudFront Origin Access Control (OAC), Route 53, and ACM SSL. | `AWS CloudFront` `Route 53` `ACM` | 🔵 *Upcoming* |
| **06** | [High Availability 3-Tier Web App](./06-three-tier-web-app) | Fault-tolerant architecture spanning private subnets across multiple AZs, an Application Load Balancer (ALB) with SSL, and an Auto Scaling Group (ASG). | `AWS ALB` `ASG` `VPC` `Terraform` | 🔵 *Upcoming* |
| **07** | [Automated Cost-Killer & Security Auditor](./07-finops-cost-killer) | FinOps governance script running on an EventBridge cron schedule via Lambda to scan and prune unattached EBS volumes and idle cloud resources. | `AWS Lambda` `EventBridge` `Python` | 🔵 *Upcoming* |

---

## 🛠️ Engineering Standards & Design Principles

* **🔒 Security First:** Strict least-privilege IAM policies, private subnets for sensitive workloads, and zero hardcoded credentials.
* **📦 Modular IaC:** Decoupled state configurations ensuring zero cross-project contamination and clean resource tracking.
* **🧹 Cost Hygiene:** Automated teardown workflows (`terraform destroy`) and FinOps governance to maintain clean cloud environments.
* **💻 Terminal-Driven Workflows:** Built using Git, VS Code, and PowerShell for rapid, reproducible deployments.

---

## 👨‍💻 Author

**Keshav Sriram Kumar**  
*Cloud & DevOps Engineering Portfolio*  
[GitHub Profile](https://github.com/KeshavSriramK)
