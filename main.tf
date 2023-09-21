## Local
locals {
  tags = {}
  force_detach_policies = true
}

## Label
module "label" {
  source = "github.com/zulunity/label"
  name   = var.name
  tags   = merge(var.tags, local.tags)
}

## IAM Role Trust Policy
# 
# Allow account to assume this IAM role
data "aws_iam_policy_document" "assume_policy" {
  count = var.enabled == true ? 1 : 0

  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.account_id]
    }
  }
}

## IAM Role
# 
# IAM role granting account access to your AWS account with the permissions
resource "aws_iam_role" "reader_role" {
  count = var.enabled == true ? 1 : 0

  name = module.label.id
  description = var.description

  assume_role_policy    = data.aws_iam_policy_document.assume_policy[0].json
  force_detach_policies = local.force_detach_policies
  max_session_duration  = var.max_session_duration

  tags = module.label.tags

  provisioner "local-exec" {
    command = "echo 'Sleeping for 9 seconds to wait for IAM object to be created'; sleep 9"
  }
}

## IAM Policy Attachments
# 
# Attach reader policies with the IAM role
resource "aws_iam_role_policy_attachment" "reader_role_policy_attachments" {
  count = var.enabled == true ? 1 : 0

  role       = aws_iam_role.reader_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  depends_on = [ aws_iam_role.reader_role ]
}