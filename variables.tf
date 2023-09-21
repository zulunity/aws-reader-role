###
# Standard Variables
#
variable "name" {
  type        = string
  default     = "zulunity-reader"
  description = "Module name, e.g. 'app' or 'jenkins'"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

###
# Module Variables
#
# Variables specific to this module
#

variable "description" {
  type        = string
  default     = ""
  description = "Module Description"
}

variable "account_id" {
  type        = string
  description = "AWS account that is allowed to assume this role"
}

variable "max_session_duration" {
  type        = number
  default     = 3600
  description = "The maximum session duration (in seconds) that you want to set for the role"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether or not to create the IAM role"
}