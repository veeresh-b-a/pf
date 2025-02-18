
# Project Name: Prismforce

## Overview
This repository contains the Terraform configuration files for managing infrastructure resources.

## Project Structure

- `main.tf`: The main Terraform configuration file where the provider and resources are defined.
- `variables.tf`: Defines the input variables for the Terraform configuration.
- `outputs.tf`: Defines the output values of the Terraform resources.
- `parameters.tfvars`: A file containing values for the variables used in the Terraform configuration.
- `modules/`: A directory containing reusable Terraform modules.
- `.terraform/`: Directory that contains the Terraform provider plugins and modules.
- `.terraform.lock.hcl`: Terraform provider lock file for managing dependencies.
- `terraform.tfstate`: Terraform state file that keeps track of the infrastructure.
- `plan.out`: Terraform plan output file for tracking infrastructure changes.

## Prerequisites

Before running Terraform, make sure you have the following installed:
- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS credentials configured via `aws configure` or environment variables.

## Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/veeresh-b-a/pf.git
   cd pf
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Review the plan:

   ```bash
   terraform plan -var-file=parameters.tfvars
   ```

4. Apply the Terraform configuration:

   ```bash
   terraform apply -var-file=parameters.tfvars
   ```
