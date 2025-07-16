variable "aws_region" {
  default = "ap-southeast-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  default  = "Nani"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0b8607d2721c94a77" # Ubuntu Server 22.04 LTS in ap-southeast-1, change for your region
}
