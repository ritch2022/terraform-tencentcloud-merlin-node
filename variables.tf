variable "prefix" {
  type        = string
  description = "Prefix used to set different resources' name"
  default     = "Merlin"
}

variable "az" {
  type        = string
  description = "Available zone"
}

variable "sg_ids" {
  type        = list(string)
  description = "Extra security groups attached to instance"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags that need to add resources"
  default     = {}
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
  validation {
    condition     = can(cidrsubnet(var.vpc_cidr, 0, 0))
    error_message = "Must be a valid IPv4 CIDR"
  }
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
  validation {
    condition     = can(cidrsubnet(var.subnet_cidr, 0, 0))
    error_message = "Must be a valid IPv4 CIDR"
  }
}

variable "instance_type" {
  type        = string
  description = "value"
  validation {
    condition     = startswith(var.instance_type, "ITA4") || startswith(var.instance_type, "ITA5") || startswith(var.instance_type, "IT5")
    error_message = "The instance_type must start with ITA4, ITA5, or IT5."
  }
}

variable "create_tat_command" {
  type        = bool
  description = "Determine whether to create the TAT command to do merlin node deployment"
}

variable "merlin_network" {
  type        = string
  description = "The network of merlin chain"
  validation {
    condition     = contains(["mainnet", "testnet"], var.merlin_network)
    error_message = "Please choose one of the following network: mainnet, testnet"
  }
}

variable "instance_charge_type" {
  type        = string
  default     = "POSTPAID_BY_HOUR"
  description = "The charge type of instance"
  validation {
    condition     = contains(["POSTPAID_BY_HOUR", "PREPAID"], var.instance_charge_type)
    error_message = "Please choose one of the following network: POSTPAID_BY_HOUR, PREPAID"
  }
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "The number of nodes need to be created"
}
