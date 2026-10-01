# Cloud Infrastructure Portfolio

Welcome to my cloud architecture and infrastructure-as-code repository. This monorepo showcases production-grade, modularized cloud deployments built with **Terraform** and **AWS**. 

Each project directory stands on its own, adhering to enterprise design patterns, high availability principles, and security best practices.

## Project Directory

| # | Project Name | Description | Key AWS Services |
|---|---|---|---|
| 01 | [VPC & Apache Web Server](./01-vpc-ec2-apache-webserver/) | Isolated custom VPC, public subnet, IGW, security groups, and automated EC2 Apache deployment. | VPC, EC2, IAM, Route Tables |

## Design Principles
* **Modularity:** Infrastructure is cleanly separated into dedicated subprojects to maintain independent states.
* **Security First:** Strict adherence to least-privilege security groups, zero public state exposure, and secure ingress/egress rules.
* **Automation:** Leveraging bootstrapping scripts and automated configuration management for hands-free provisioning.
