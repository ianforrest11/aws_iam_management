module "iam_group_creation" {
  source     = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_group?ref=main"
  groups     = var.groups
}
