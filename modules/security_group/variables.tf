variable "vpc_id" {
  description = "VPC ID where the security group is created"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "ec2-rds-sg"
}

variable "ec2_ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed for SSH access"
  type        = list(string)
}

variable "rds_ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed for MySQL access"
  type        = list(string)
}
