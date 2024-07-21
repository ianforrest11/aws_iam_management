locals {
  policy_names = [
    "2fa",
    "admin",
    "AmazonEC2ContainerRegistryReadOnly",
    "AmazonEKS_CNI_Policy",
    "AmazonEKSWorkerNodePolicy",
    "AmazonEKSClusterPolicy"
  ]
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