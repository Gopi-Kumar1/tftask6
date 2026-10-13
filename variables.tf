variable "region" {
  description = "AWS region where all resources are created."
  type        = string
}

variable "az_a" {
  description = "Availability Zone for public subnet A."
  type        = string
}

variable "az_b" {
  description = "Availability Zone for public subnet B."
  type        = string
}

variable "az_c" {
  description = "Availability Zone for public subnet C."
  type        = string
}

variable "project_id" {
  description = "Project identifier used as the prefix for all resource names."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC."
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "CIDR block of public subnet A."
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block of public subnet B."
  type        = string
}

variable "public_subnet_c_cidr" {
  description = "CIDR block of public subnet C."
  type        = string
}

variable "internet_cidr" {
  description = "Destination CIDR block for the internet route."
  type        = string
}