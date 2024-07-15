locals {
  policy_names = ["2fa", "admin", "eks_cluster", "eks_ec2_nodes", "eks_ecr_ec2_nodes"]
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