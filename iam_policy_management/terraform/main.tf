module "iam_policy_creation_admin" {
  source = "https://github.com/ianforrest11/terraform_templates.git//aws/iam_user_policy?ref=main"
  policy_name = "admin"
}

module "iam_policy_creation_2fa" {
  source = "https://github.com/ianforrest11/terraform_templates.git//aws/iam_user_policy?ref=main"
  policy_name = "2fa"
}