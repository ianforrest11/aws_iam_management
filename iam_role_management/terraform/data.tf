locals {
  policy_names = ["2fa", "admin", "eks_cluster", "eks_container_registry_read_only", "eks_service"]
}

data "aws_iam_policy" "policies" {
  for_each = toset(local.policy_names)
  name     = each.value
}

locals {
  policies = {
    for policy in data.aws_iam_policy.policies : policy.name => policy.arn
  }
}