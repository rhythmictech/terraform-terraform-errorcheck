
variable "assert" {
  description = "Make your assertion here so that it resolves to a boolean value. If this value is false, the module will throw an error."
  type        = bool
}

variable "error_message" {
  default     = "Assertion failed"
  description = "Error message to return if the assertion fails"
  type        = string
}
