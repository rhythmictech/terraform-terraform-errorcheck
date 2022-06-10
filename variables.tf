
variable "assert" {
  description = "Make your assertion here so that it resolves to a boolean value. If this value is false, the module will throw an error."
  type        = bool
}

variable "error_message" {
  default     = "Assertion failed"
  description = "Error message to return if the assertion fails"
  type        = string
}

variable "python_program" {
  default     = "python"
  description = "Python executable to call errorcheck with"
  type        = string
}

variable "use_jq" {
  default     = false
  description = "Use jq to check for truthiness. Defaults to python"
  type        = bool
}
