variable "db_password" {
  description = "Master password for the RDS PostgreSQL database"
  type        = string
  sensitive   = true

  validation {
    condition = (
      length(var.db_password) >= 8 &&
      length(var.db_password) <= 41 &&
      !strcontains(var.db_password, "/") &&
      !strcontains(var.db_password, "\"") &&
      !strcontains(var.db_password, "@")
    )
    error_message = "The RDS master password must be 8-41 characters and cannot contain /, \", or @."
  }
}

variable "jwt_secret" {
  description = "JWT signing secret for the application"
  type        = string
  sensitive   = true
}

variable "GH_org" {
  description = "GitHub username or organization that owns frontend and backend"
  type        = string
  default     = "zenpharma01"
}
