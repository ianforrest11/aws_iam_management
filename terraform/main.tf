module "iam_user_policies" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_user_policies?ref=main"
}

module "iam_user_creation" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_user?ref=main"
  users = var.users
}