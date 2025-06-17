# AWS VPC and EC2 Provisioning with Terraform

This Terraform configuration creates a VPC with public and private subnets across multiple availability zones, and provisions an EC2 instance accessible via HTTP.
This configuration is designed to be clean, minimal, and compliant with standard AWS best practices.

## Architecture

- VPC with CIDR block 10.0.0.0/16
- 3 public subnets across different AZs with a route to the Internet Gateway
- 3 private subnets across different AZs with no direct route to the internet
- Dedicated Route Tables to control traffic for public and private subnets independently
- Internet Gateway for public subnets
- EC2 instance in public subnet with HTTP access. The associate_public_ip_address flag is explicitly set to true to clearly state the intent of assigning a public IP, even though the public subnet would assign one by default.
- A Security Group that allows inbound TCP traffic on port 80 (HTTP) from any IP address (0.0.0.0/0)

## Prerequisites

### Before you begin, ensure you have the following installed and configured:

1. Terraform (v1.0 or later)
   
2. AWS CLI

3. AWS Credentials configured for your terminal session.

## Configuration and Reusability

This project is parameterized for flexibility. You can customize the deployment by overriding the default values in ```variables.tf```.

The recommended method is to create a file named ```terraform.tfvars``` and define your custom values there. 
Remember that AMI IDs are region-specific - if you change the ```aws_region```, you must also provide a valid ```ami_id``` for the new region.

Example ```terraform.tfvars```

```bash
# terraform.tfvars

instance_type = "t2.small"
ami_id        = "ami-015b1e8e2a6899bdb"

```

## Usage

1. Clone the repository:

```bash
    git clone https://github.com/aldeop/custom-vpc.git
    cd custom-vpc
```

2. Initialize Terraform:

```bash
   terraform init
```
   
3. Review plan:

```bash
    terraform plan
```

4. Apply changes:

```bash
    terraform apply
```
Enter ```yes``` when prompted to confirm the changes.

## Outputs

After completion, Terraform will display the following outputs:

- The public IP address of the EC2 web server
- The ID of the created VPC
- A list of the public subnet IDs
- A list of the private subnet IDs

## Cleaning Up

Destroy all created resources running command:

```bash
    terraform destroy
```
