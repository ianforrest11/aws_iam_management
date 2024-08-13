module "iam_identity_provider_creation_github" {
  source                = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_identity_provider?ref=main"
  identity_provider     = var.identity_provider_github
}

module "iam_identity_provider_creation_circleci" {
  source                = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_identity_provider?ref=main"
  identity_provider     = var.identity_provider_circleci
}