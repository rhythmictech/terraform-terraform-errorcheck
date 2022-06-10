locals {
  compare     = "success"
  testSuccess = "success"
  testFail    = "fail"
}

module "errorcheck_valid" {
  source = "../.."

  assert        = local.compare == local.testSuccess
  error_message = "Your assertion is not valid"
}

module "errorcheck_valid_jq" {
  source = "../.."

  assert        = local.compare == local.testSuccess
  error_message = "Your assertion is not valid"
  use_jq        = true
}

module "errorcheck_valid_python3" {
  source = "../.."

  assert         = local.compare == local.testSuccess
  error_message  = "Your assertion is not valid"
  python_program = "python3"
}
