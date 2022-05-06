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
