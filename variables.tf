variable "suffix" {
  type        = string
  description = "Suffix used to set different resources' name"
  default     = "Merlin"
}

variable "az" {
  type        = string
  description = "Available zone"
}

variable "sg_ids" {
  type        = list(string)
  description = "Security group ids"
}

variable "tags" {
  type        = map(string)
  description = "Tags that need to add resources"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "The VPC ID to use. If not provided, a new VPC will be created."
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The cidr used to create vpc"
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "The subnet ID to use. If not provided, a new subnet will be created."
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "The cidr used to create subnet"
}

variable "instance_type" {
  type        = string
  description = "value"
}

variable "create_tat_command" {
  type        = bool
  description = "Determine whether to create the TAT command to do merlin node deployment"
}