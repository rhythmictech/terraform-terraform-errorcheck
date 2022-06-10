
locals {
  jq_program = ["/bin/sh", "-efu", "${path.module}/bin/errorcheck.sh"]
  py_program = [var.python_program, "${path.module}/python/errorcheck.py"]
  program    = var.use_jq ? local.jq_program : local.py_program
}

data "external" "this" {
  program = local.program

  query = {
    assert        = var.assert
    error_message = var.error_message
  }
}
