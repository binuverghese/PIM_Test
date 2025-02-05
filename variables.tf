variable "pim_group_name" {
  description = "Name of the PIM-enabled group"
  type        = string
  default     = "PIM-Admin-Group"
}

variable "group_owner_email" {
  description = "Owner email for the PIM group"
  type        = string
  default     = "admin@domain.com"
}

variable "eligible_users" {
  description = "List of users eligible for PIM role assignment"
  type        = list(string)
  default     = ["user1@domain.com", "user2@domain.com"]
}

variable "role_assignment" {
  description = "Azure RBAC role to assign to PIM group"
  type        = string
  default     = "Owner"
}

variable "subscription_id" {
  description = "Subscription ID where the PIM group is assigned"
  type        = string
  default     = "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx"
}
