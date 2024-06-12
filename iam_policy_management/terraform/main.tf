module "iam_policy_creation" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_user_policy?ref=main"
  users = var.users
} 