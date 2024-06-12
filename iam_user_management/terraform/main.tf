module "iam_user_creation" {
  source = "https://github.com/ianforrest11/terraform_templates.git//aws/iam_user?ref=main"
  users = var.users
} 