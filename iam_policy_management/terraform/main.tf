module "iam_policy_creation_admin" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_user_policy?ref=main"
  policy_name = var.policy_name_admin
}

module "iam_policy_creation_2fa" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_user_policy?ref=main"
  policy_name = var.policy_name_2fa
}