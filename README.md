# Example Voting App

A simple distributed application running across multiple Docker containers.

Enterprise DevSecOps Voting Application
Note: This project is a specialized fork of the original Docker Example Voting App. While the core microservices remain the same, this repository transforms the original "local-only" example into a production-ready Enterprise DevSecOps Pipeline deployed on AWS.

🚀 What I Added: The "Enterprise" Layer
I have upgraded this basic example into a full-scale cloud-native architecture. The following components were added to implement industry-standard DevSecOps practices:


🛡️ DevSecOps & Security
SonarQube/SonarCloud Integration: Implemented Static Application Security Testing (SAST) to detect bugs, vulnerabilities, and code smells before deployment.

Automated Quality Gate: The pipeline is configured to fail if security standards are not met.


⚙️ CI/CD Automation
GitHub Actions Pipeline: Created a multi-stage workflow that automates the entire lifecycle:

Code Analysis: Automated SonarCloud scanning.

Containerization: Multi-service Docker builds for Python, Node.js, and .NET.

Image Management: Automated versioning and pushing to Docker Hub.

Continuous Deployment: Automated "Rolling Updates" to AWS EKS.


☁️ Infrastructure as Code (IaC)
Terraform: Completely automated the AWS infrastructure provisioning. No manual clicks in the console.

Custom VPC: Designed a secure network with public/private subnets, Internet Gateways, and NAT Gateways.

AWS EKS (Elastic Kubernetes Service): Provisioned a managed Kubernetes cluster with auto-scaling worker nodes (t3.small).


🛠️ Skills & Technologies Reflected
This updated project demonstrates mastery in the following domains:

Cloud Provider: AWS (EKS, VPC, IAM, EC2).

Containerization: Docker, Docker-Compose, Multi-stage builds.

Orchestration: Kubernetes (Deployments, Services, NodePorts, RBAC).

IaC: Terraform (State management, Providers, Modules).

CI/CD: GitHub Actions (Secrets management, Environments, Workflows).

Security: SAST (SonarCloud), IAM Principle of Least Privilege.



## Architecture

![Architecture diagram](architecture.excalidraw.png)


* 🏗️ Updated Architecture
The original microservices now run within a secure, automated cloud environment:

Frontend (Python/Flask): Users vote on a public-facing interface.

Broker (Redis): Fast, in-memory queue for incoming votes.

Processor (.NET): A worker service that moves data from Redis to Postgres.

Database (PostgreSQL): Persistent storage for all votes.

Analytics (Node.js): Real-time results dashboard.


🚦 Getting Started (Cloud Version)
1. Provision Infrastructure
Bash
cd terraform
terraform init
terraform apply --auto-approve

3. Configure Access
Bash
aws eks update-kubeconfig --name voting-app-cluster --region ap-south-1

4. Deploy via Pipeline
Simply push code to the main branch. GitHub Actions will handle the security scan, build, and deployment.


📝 Project Takeaways
This project showcases the ability to bridge the gap between Software Development and Cloud Operations. It focuses on:

Reliability: Using K8s to ensure zero-downtime deployments.

Scalability: Using EKS to handle traffic spikes.

Security: Ensuring every line of code is scanned before it touches the cloud


## Notes

The voting application only accepts one vote per client browser. It does not register additional votes if a vote has already been submitted from a client.

This isn't an example of a properly architected perfectly designed distributed app... it's just a simple
example of the various types of pieces and languages you might see (queues, persistent data, etc), and how to
deal with them in Docker at a basic level.
