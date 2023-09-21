<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
Terraform AWS Reader Role Module
========================

## Overview

This module creates an AWS Reader role giving reader permission to the trusted Account. Please ask for the account_id to your Zuluner.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | 5.0.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | 5.0.0 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 account_id  = 

	 # Optional variables
	 description  = ""
	 enabled  = true
	 max_session_duration  = 3600
	 name  = "zulunity-reader"
	 tags  = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_iam_role.reader_role](https://registry.terraform.io/providers/hashicorp/aws/5.0.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.reader_role_policy_attachments](https://registry.terraform.io/providers/hashicorp/aws/5.0.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_policy](https://registry.terraform.io/providers/hashicorp/aws/5.0.0/docs/data-sources/iam_policy_document) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account_id](#input_account_id) | AWS account that is allowed to assume this role | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input_description) | Module Description | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input_enabled) | Whether or not to create the IAM role | `bool` | `true` | no |
| <a name="input_max_session_duration"></a> [max_session_duration](#input_max_session_duration) | The maximum session duration (in seconds) that you want to set for the role | `number` | `3600` | no |
| <a name="input_name"></a> [name](#input_name) | Module name, e.g. 'app' or 'jenkins' | `string` | `"zulunity-reader"` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn_role"></a> [arn_role](#output_arn_role) | arn role created |
| <a name="output_context"></a> [context](#output_context) | Label context |
| <a name="output_enabled"></a> [enabled](#output_enabled) | Whether or not the module is enabled |
| <a name="output_name"></a> [name](#output_name) | Name of the asset |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->