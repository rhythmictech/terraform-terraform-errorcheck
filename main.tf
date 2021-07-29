data "external" "this" {
  program = ["/bin/sh", "-efu", "${path.module}/bin/errorcheck.sh"]

  query = {
    assert        = var.assert
    error_message = var.error_message
  }
}
