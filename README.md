# ☁️ Cloud Infrastructure & DevOps Portfolio

> Production-grade cloud automation, serverless architectures, and infrastructure-as-code built from scratch using Terraform, AWS, Docker, and Python.

---

## 🚀 Architectural Progression Roadmap

Each project represents a step forward in cloud engineering maturity—progressing from foundational storage and networking to resilient multi-tier architectures and automated FinOps governance.

| # | Project Name | Architecture & Key Deliverables | Core Tech Stack | Status |
| :---: | :--- | :--- | :--- | :---: |
| **01** | [S3 Static Website Hosting](./01-s3-static-website-hosting) | Automated deployment of a static website on Amazon S3 with public-read bucket policies and static hosting configuration. | `AWS S3` `Terraform` `HTML5` | 🟢 Completed |
| **02** | [VPC & EC2 Apache Web Server](./02-vpc-ec2-apache-webserver) | Custom Virtual Private Cloud (VPC), public subnets, security groups, and automated EC2 Apache deployment via `user_data`. | `AWS VPC` `EC2` `IAM` `Terraform` | 🟢 Completed |
| **03** | [Containerized Game Server & Automated SSL](./03-containerized-game-server-ssl) | Containerized workload behind an Nginx reverse proxy, automated Let's Encrypt TLS certificates, and a Python Discord monitoring daemon. | `Docker` `Nginx` `SSM` `Python` | 🟢 Completed |
| **04** | [Automated VPC, EC2 & S3 Provisioning](./04-automated-vpc-ec2-s3-provisioning) | End-to-end Terraform deployment of a segmented VPC, web server instance, and private S3 bucket with strict access controls. | `AWS VPC` `S3` `Bash` `Terraform` | 🟢 Completed |
| **05** | [Serverless Event-Driven Event Matcher](./05-serverless-event-driven-matcher) | Event-driven backend using API Gateway, AWS Lambda (Python), EventBridge, DynamoDB, and Amazon SES for automated notifications. | `Lambda` `API Gateway` `DynamoDB` `SES` | 🟢 Completed |
| **06** | [CloudFront OAC Secure Static Website](./06-cloudfront-oac-secure-website) | Hardened static hosting with a private S3 bucket locked behind CloudFront Origin Access Control (OAC) and HTTPS enforcement. | `CloudFront` `S3` `OAC` `Terraform` | 🟡 In Progress |
| **07** | High-Availability 3-Tier Web Architecture | Fault-tolerant multi-AZ architecture spanning private subnets, an Application Load Balancer (ALB) with SSL, and an Auto Scaling Group. | `ALB` `ASG` `VPC` `Terraform` | 🔵 Planned |
| **08** | Automated FinOps & Security Auditor | Governance script running on an EventBridge schedule via Lambda to scan and prune unattached EBS volumes and idle cloud resources. | `Lambda` `EventBridge` `Python` | 🔵 Planned |

---

## 🛠️ Engineering Standards & Design Principles

* **🔒 Security First:** Strict least-privilege IAM policies, private subnets for sensitive workloads, and zero hardcoded credentials.
* **📦 Modular IaC:** Decoupled Terraform state configurations ensuring zero cross-project contamination and clean resource tracking.
* **🧹 Cost Hygiene:** Automated teardown workflows (`terraform destroy`) and FinOps governance to maintain lean cloud environments.
* **💻 Reproducible Workflows:** Built using Git, VS Code, and CLI automation for repeatable deployments.

---

## 👨‍💻 Author

**Keshav Sriram Kumar**  
*Cloud & DevOps Engineering Portfolio*  
[GitHub Profile](https://github.com/KeshavSriramK)
