variable "ami" {
  description = "AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "public_subnet_id" {
  description = "The subnet ID in which to launch the instance"
  type        = string
}

variable "key_name" {
  description = "Name of the AWS key pair for SSH"
  type        = string
}

variable "sg_id" {
  description = "Security group ID to attach to the instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
  default     = "ec2-instance"
}
