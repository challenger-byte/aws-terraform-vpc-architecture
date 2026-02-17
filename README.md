# AWS VPC Architecture with Bastion & Private Subnet (Terraform)

This project demonstrates a foundational AWS networking architecture built and refactored using Terraform.

It showcases the evolution from a single-file Terraform configuration to a modular infrastructure design separating network and compute layers.

---

## 📌 Project Overview

The infrastructure provisions:

- Custom VPC
- Public and Private Subnets
- Internet Gateway (IGW)
- NAT Gateway for outbound-only internet access
- Route Tables and Associations
- Bastion Host in Public Subnet
- Private EC2 Instance in Private Subnet
- Security Group referencing (SG-to-SG trust)
- Ubuntu AMI via data source

The architecture ensures:

- Public access only through bastion
- Private instance has outbound internet access via NAT
- No public IP attached to private EC2
- Clear separation between reachability and permission

---

# 🧱 v1 — Single File Architecture

Located in:

v1/


This version contains the entire infrastructure defined in a single `terraform.tf` file.

### Purpose

- Understand Terraform dependency graph behavior
- Learn AWS networking fundamentals deeply
- Observe resource creation order
- Practice manual reasoning about routing vs security groups

This version helped build strong mental models around:

- Public vs Private subnets
- NAT Gateway behavior
- Route table associations
- Security group identity-based access
- Infrastructure reproducibility

---

# 🏗 v2 — Modular Architecture

Located in:

v2/


This version refactors the infrastructure into reusable modules:


modules/  
├── network/  
└── compute/  


### Improvements Introduced

- Separation of concerns (Network vs Compute)
- Explicit input variables
- Outputs for inter-module communication
- Removal of hardcoded values
- Environment configurability via `terraform.tfvars`
- Explicit provider configuration

### Architecture Layers

**Network Module**
- VPC
- Subnets
- Internet Gateway
- NAT Gateway
- Route Tables

**Compute Module**
- Security Groups
- Bastion EC2
- Private EC2
- AMI Data Source

This modular structure improves:

- Reusability
- Maintainability
- Clarity
- Scalability
- Infrastructure design discipline

---

# 🧠 Key Architectural Concepts Demonstrated

- Routing determines reachability
- Security Groups determine permission
- NAT enables outbound-only internet access
- Terraform builds a dependency graph (not a script)
- Infrastructure can be reproducible and disposable
- Modular Terraform isolates concerns through inputs and outputs

---

# ⚙️ Configuration

The modular version requires variable inputs.

Example `terraform.tfvars` (not committed):

```hcl
region               = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidr  = "10.0.2.0/24"
allowed_ssh_cidr     = "YOUR_IP/32"
key_name             = "your-key-name"  
```

🚀 How to Deploy

Inside v2/

```
terraform init
terraform plan
terraform apply
```

To destroy:

```
terraform destroy
```
🔐 Next Iteration

The next planned improvement is:

Remove SSH access entirely

Eliminate Bastion Host

Replace key-based access with IAM + AWS Systems Manager (SSM)

Achieve zero inbound ports architecture

📖 Learning Goals

This project was built to:

Strengthen AWS networking fundamentals

Understand Terraform graph-based provisioning

Practice infrastructure refactoring

Move toward production-style cloud architecture

👤 Author

Bikramjit Roy(challenger-byte)
Self-taught Cloud Learner