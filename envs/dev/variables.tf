variable "db_password" {
  description = "Master password for the RDS PostgreSQL database"
  type        = string
  sensitive   = true

  validation {
    condition     = can(regex("^[!#-\\.0-?A-Z\\[-~]{8,41}$", var.db_password))
    error_message = "db_password must be 8-41 printable ASCII characters and cannot contain '/', '\"', or '@'. Update the DEV_DB_PASSWORD GitHub secret."
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
