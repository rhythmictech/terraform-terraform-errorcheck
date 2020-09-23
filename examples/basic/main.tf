locals {
  compare     = "success"
  testSuccess = "success"
  testFail    = "fail"
}

module "errorcheck_valid" {
  source  = "rhythmictech/errorcheck"
  version = "~> 1.0.0-rc1"

  assert        = local.compare == local.testSuccess
  error_message = "Your assertion is not valid"
}

module "errorcheck_invalid" {
  source  = "rhythmictech/errorcheck"
  version = "~> 1.0.0-rc1"

  assert        = local.compare == local.testFail
  error_message = "Your assertion is not valid"
}
