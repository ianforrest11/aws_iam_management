module "iam_role_creation" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_role?ref=main"
  users = var.roles
} 