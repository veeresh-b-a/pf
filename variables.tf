variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "key_name" {
  description = "Name of the AWS key pair for SSH access"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami" {
  description = "AMI for the EC2 instance (ensure this AMI is available in your region)"
  type        = string
}

variable "db_identifier" {
  description = "RDS DB identifier"
  type        = string
  default     = "mydb"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t2.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS instance (in GB)"
  type        = number
  default     = 20
}

variable "ec2_ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the EC2 instance via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "rds_ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the RDS MySQL instance"
  type        = list(string)
  default     = ["10.0.0.0/16"]  # restrict access to the VPC
}
