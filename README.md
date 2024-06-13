# aws_iam_management
repository for managing IAM resources in AWS account through a github actions workflow

# modules included:
- iam group management
- iam identity provider management
- iam policy management
- iam role management
- iam user management

# iam group management
- This module creates IAM groups to easily manage which policies are attached to which users.  Instead of creating multiple users requiring the same permissions and managing them individually, they can be attached to a group and have all the required permissions granted automatically.
- To use, navigate to `iam_group_management/variables/terraform.tfvars` and add a new key into the `groups` object map.  To create a group called `developers`, we would configure the object like this:
```
"developers" = {
    group_name = "developers"
    policies   = ["arn:aws:iam::123456789012:policy/developers"]
}
```
- this configuration assumes policy `arn:aws:iam::123456789012:policy/developers` exists in the AWS account
- once this updated configuration is pushed to the `main` branch, the `.github/workflows/terraform.yml` workflow will pick it up and create the group `developers` in AWS

# iam identity provider management
- This module creates IAM identity providers to grant accesses and permissions to services outside of AWS, such as GitHub.  Instead of creating users and access keys to access these outside services, they can be granted temporary credentials using identity providers instead.  I mainly used this to facilitate communication between GitHub and AWS, but there are a variety of use cases.
- To use, navigate to `iam_identity_provider_management/variables/terraform.tfvars` and add a new key into the `groups` object map.  To create a group called `developers`, we would configure the object like this:
```
"developers" = {
    group_name = "developers"
    policies   = ["arn:aws:iam::123456789012:policy/developers"]
}
```
- this configuration assumes policy `arn:aws:iam::123456789012:policy/developers` exists in the AWS account
- once this updated configuration is pushed to the `main` branch, the `.github/workflows/terraform.yml` workflow will pick it up and create the group `developers` in AWS

