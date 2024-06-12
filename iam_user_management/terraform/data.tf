locals {
  all_groups = flatten([
    for user in var.users : user.groups
  ])
}

data "aws_iam_group" "groups" {
  for_each   = toset(local.all_groups)
  group_name = each.key
}