
output "asset" {
  description = "Make your assertion here so that it resolves to a boolean value. If this value is false, the module will throw an error."
  value       = var.assert
}

output "error_message" {
  description = "Error message to return if the assertion fails"
  value       = var.error_message
}

output "result" {
  description = "Result of data source"
  value       = data.external.this.result
}

output "use_jq" {
  description = "Use jq to check for truthiness. Defaults to python"
  value       = var.use_jq
}
