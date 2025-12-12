  ## 🏗️ Three-Tier AWS Architecture using Terraform
  This project deploys a 3‑Tier AWS Infrastructure using Terraform. It includes
   
  ## 🖼️ Architecture Diagram


```
                    ┌──────────────────────────┐
                    │        Internet          │
                    └────────────▲─────────────┘
                                 │
                      ┌──────────┴──────────┐
                      │   Internet Gateway  │
                      └──────────▲──────────┘
                                 │
                   ┌─────────────┴──────────────┐
                   │          Public Subnet      │
                   │    (Web EC2 Instance)      │
                   └─────────────▲──────────────┘
                                 │
                      ┌──────────┴──────────┐
                      │     NAT Gateway     │
                      └──────────▲──────────┘
                                 │
                   ┌─────────────┴──────────────┐
                   │        Private Subnet       │
                   │   (App EC2 Instance)       │
                   └─────────────▲──────────────┘
                                 │
                   ┌─────────────┴──────────────┐
                   │        Private Subnet       │
                   │   (DB EC2 Instance)        │
                   └────────────────────────────┘
```

## 🌐 VPC Setup
This project creates a fully customized **Virtual Private Cloud** (VPC) to host a secure 3-Tier infrastructure. The VPC contains **public and private subnets**, routing, and internet access components.

## 🔒 Network Security Setup
**Security Groups** are configured to control traffic between application and **database servers**. **Public access** is only allowed to the application server.

## 🖥 Compute 
1 Web Server – Public Subnet

2 App Server – Private Subnet

3 DB Server – Private Subnet

## 📌 Security Group
✔ SSH (22) → Anywhere (0.0.0.0/0) → For login

✔ HTTP (80) → Anywhere → Website access

✔ HTTPS (3306)

## 📁 project structure

```
terraform-project/
│
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```
## ⚙️ How to Run the Project

 * terraform init
 * terraform plan
 * terraform apply

 ![](./img/Screenshot%202025-12-12%20160137.png)

 ## 📤 Outputs

  ##  VPC Creation
  * A custom CIDR block is created (e.g., 10.0.0.0/16)
 * All the AWS resources in this project  are deployed inside this VPC

  ![](./img/Screenshot%202025-12-12%20155323.png)

  ## 4️⃣ Internet Gateway (IGW)

* Provides internet access to the public   subnet
* Allows the public EC2 instance to be    accessed externally via SSH/HTTP

![](./img/Screenshot%202025-12-12%20155436.png)

 ## Route Table

 * Public Route Table: Has a default route (0.0.0.0/0) pointing to the IGW

* Private Route Table: No internet route → increases security for backend resources

![](./img/Screenshot%202025-12-12%20155416.png)

## Public Subnet

* This subnet is connected to the internet
* The public EC2 instance (app-server) is launched here
* Auto-assign public IP is enabled so the instance can be accessed externally

![](./img/Screenshot%202025-12-12%20155348.png)

## EC2 Instances

* Web Server – Public Subnet (Internet-facing)
* App Server – Private Subnet (Internal processing)
* DB Server – Private Subnet (Secure storage)

![](./img/Screenshot%202025-12-12%20160019.png)

## S3 Bucket

* Web Server can pull static content from S3
* App Server can read/write application data
* DB Server backups can be stored in S3
* Terraform can use S3 as a remote backend to store state

![](./img/Screenshot%202025-12-12%20155829.png) 

##  📝 Conclusion

This Terraform project builds a complete 3‑Tier AWS Infrastructure with best practices such as:
* S3 Remote Backend
* Private Subnets + NAT
* Layered Security

## 👤 Author

Vedika Sainath Kadam
Terraform | AWS | DevOps Enthusiast 🚀