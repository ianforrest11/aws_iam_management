module "iam_policy_creation_2fa" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_policy?ref=main"
  policy_name = var.policy_name_2fa
}

module "iam_policy_creation_admin" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_policy?ref=main"
  policy_name = var.policy_name_admin
}

module "iam_policy_creation_eks_cluster" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_policy?ref=main"
  policy_name = var.policy_name_eks_cluster
}

module "iam_policy_creation_eks_container_registry_read_only" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_policy?ref=main"
  policy_name = var.policy_name_eks_container_registry_read_only
}

module "iam_policy_creation_eks_service" {
  source = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_policy?ref=main"
  policy_name = var.policy_name_eks_service
}