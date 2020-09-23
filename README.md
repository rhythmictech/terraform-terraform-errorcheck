# terraform-terraform-errorcheck
A Terraform module that throws an error at plan time if an arbitrary assertion fails.

[![tflint](https://github.com/rhythmictech/terraform-terraform-errorcheck/workflows/tflint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-terraform-errorcheck/actions?query=workflow%3Atflint+event%3Apush+branch%3Amaster)
[![tfsec](https://github.com/rhythmictech/terraform-terraform-errorcheck/workflows/tfsec/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-terraform-errorcheck/actions?query=workflow%3Atfsec+event%3Apush+branch%3Amaster)
[![yamllint](https://github.com/rhythmictech/terraform-terraform-errorcheck/workflows/yamllint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-terraform-errorcheck/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amaster)
[![misspell](https://github.com/rhythmictech/terraform-terraform-errorcheck/workflows/misspell/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-terraform-errorcheck/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amaster)
[![pre-commit-check](https://github.com/rhythmictech/terraform-terraform-errorcheck/workflows/pre-commit-check/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-terraform-errorcheck/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amaster)
<a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=twitter" alt="follow on Twitter"></a>

## Example
Here's what using the module will look like  
The `errorcheck_valid` module will pass, but the `errorcheck_invalid` module will fail, aborting the plan.
```hcl
locals {
  compare     = "success"
  testSuccess = "success"
  testFail    = "fail"
}

module "errorcheck_valid" {
  source = "rhythmictech/errorcheck"
  version = "~> 1.0.0-rc1"

  assert = local.compare == local.testSuccess
  error_message = "Your assertion is not valid"
}

module "errorcheck_invalid" {
  source = "rhythmictech/errorcheck"
  version = "~> 1.0.0-rc1"

  assert = local.compare == local.testFail
  error_message = "Your assertion is not valid"
}
```
Output:
```bash
Error: failed to execute "python": Traceback (most recent call last):
  File "./python/errorcheck.py", line 15, in <module>
    raise Exception(DATA['error_message'])
Exception: Your assertion is not valid


  on main.tf line 1, in data "external" "this":
   1: data "external" "this" {
```

## About
This module exists because Terraform's native ability to throw errors at plan time is extremely limited if your provider doesn't do plan-time validation. Using this module you can use any arbitrary assertion to do plan-time validation. Our particular use-case was making sure the targeted environment matches the workspace.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name      | Version    |
|-----------|------------|
| terraform | >= 0.12.28 |
| external  | ~> 1.2     |

## Providers

| Name     | Version |
|----------|---------|
| external | ~> 1.2  |

## Inputs

| Name           | Description                                                                                                              | Type     | Default              | Required |
|----------------|--------------------------------------------------------------------------------------------------------------------------|----------|----------------------|:--------:|
| assert         | Make your assertion here so that it resolves to a boolean value. If this value is false, the module will throw an error. | `bool`   | n/a                  |   yes    |
| error\_message | Error message to return if the assertion fails                                                                           | `string` | `"Assertion failed"` |    no    |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## The Giants Underneath this Module
- [pre-commit.com](pre-commit.com)
- [terraform.io](terraform.io)
- [github.com/tfutils/tfenv](github.com/tfutils/tfenv)
- [github.com/segmentio/terraform-docs](github.com/segmentio/terraform-docs)
