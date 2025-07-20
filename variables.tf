variable "product" {
  type        = string
  description = "Name of the product"
}

variable "environment" {
  type        = string
  description = "Environment name like dev, prod, uat"
}

variable "purpose" {
  type        = string
  description = "Purpose of the resource group"
}

variable "region_short" {
  type        = string
  description = "Short name for the Azure region (e.g., eus for East US)"
}

variable "instance_number" {
  type        = number
  description = "Instance number of the deployment"
}
