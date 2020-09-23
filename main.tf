data "external" "this" {
  program = ["python", "${path.module}/python/errorcheck.py"]

  query = {
    assert        = var.assert
    error_message = var.error_message
  }
}
