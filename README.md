## aws_iam_management
A portfolio repository for managing IAM resources in an AWS account through a github actions workflow

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
- To create an IAM identity provider for `Gitlab`, first navigate to `iam_identity_provider_management/terraform/main.tf` and add a module called `iam_identity_provider_creation_gitlab`.  For the `source` variable, use `git@github.com:ianforrest11/terraform_templates.git//aws/iam_identity_provider?ref=main`. For the `identity_provider` variable, use `var.identity_provider_gitlab`.  Like this:
```
module "iam_identity_provider_creation_gitlab" {
  source                = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_identity_provider?ref=main"
  identity_provider     = var.identity_provider_gitlab
}
```
- Second, navigate to the `iam_identity_provider_management/terraform/variables.tf` file and add a placeholder variable to recognize the `var.identity_provider_gitlab` we added in the previous step.  It can be as simple as one line: `variable identity_provider_gitlab {}`
- Third, navigate to the `iam_identity_provider_management/variables/terraform.tfvars` file and add an object called `identity_provider_gitlab`, with variable `client_id_list` populated as `["sts.amazonaws.com"]`, variable `provider_url` populated as `http://gitlab.com`, and variable `thumbprint_list` populated as `["2b8f1b57330dbba2d07a6c51f70ee90ddab9ad8e"]`.  Determining how these values were determined is outside the scope of this project.  Example:
```
identity_provider_github = {
  client_id_list  = ["http://gitlab.com"]
  provider_url    = "http://gitlab.com"
  thumbprint_list = ["2b8f1b57330dbba2d07a6c51f70ee90ddab9ad8e"]
}
```
- once this updated configuration is pushed to the `main` branch, the `.github/workflows/terraform.yml` workflow will pick it up and create the identity provider `gitlab.com` in AWS

# iam policy management
- This module creates IAM policies to be used with groups, users, and roles.
- To create an IAM policy for developers called `developer`, first navigate to `iam_policy_management/terraform/main.tf` and add a module called `iiam_policy_creation_developer`.  For the `source` variable, use `git@github.com:ianforrest11/terraform_templates.git//aws/iam_policy?ref=main`. For the `policy_name` variable, use `var.policy_name_developer`.  Like this:
```
module "iam_policy_creation_2fa" {
  source                = "git@github.com:ianforrest11/terraform_templates.git//aws/iam_policy?ref=main"
  identity_provider     = var.policy_name_developer
}
```
- Second, navigate to the `iam_policy_management/terraform/variables.tf` file and add a placeholder variable to recognize the `var.policy_name_developer` we added in the previous step.  It can be as simple as one line: `variable policy_name_developer {}`
- Third, navigate to the `iam_policy_management/variables/terraform.tfvars` file and add a variable called `policy_name_developer` and assign it a value of `developer`.  It can be as simple as one line: `policy_name_developer = "developer"`
- Fourth, navigate to the `iam_policy_management/json` folder and create a file called `developer.json`.  This will house the contents of the `developer` IAM policy and will vary depending on use case.  For example purposes we will use a random policy created by ChatGPT:
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*"
      ],
      "Resource": "*"
    }
  ]
}

```
- once this updated configuration is pushed to the `main` branch, the `.github/workflows/terraform.yml` workflow will pick it up and create the policy `developer` in AWS


# iam role management
- This module creates IAM roles in AWS.
- To use, navigate to `iam_role_management/variables/terraform.tfvars` and add a new key into the `roles` object map.  To create a role called `developer` that gives readonly access to EC2s, we would configure the object like this:
```
"developer" = {
    assume_role_policy_name = "developer"
    environment             = "shared"
    name                    = "developer"
    policies                = ["arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"]
    purpose                 = "allow developers to interact with EC2 resources on a readonly basis"
    }
```
- Next, navigate to the `iam_role_management/json` directory and create a file called `developer.json` and paste the EC2-specific assume role policy contents therein, e.g.:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}
```
- once this updated configuration is pushed to the `main` branch, the `.github/workflows/terraform.yml` workflow will pick it up and create the role `developer` in AWS

# iam user management
- This module creates IAM users in AWS.
- To use, navigate to `iam_user_management/variables/terraform.tfvars` and add a new key into the `users` object map.  To create a user called `jappleseed` with memberships to groups `read_only` & `2fa`, no additional individual policies, and tagged as a developer, we would configure the object like this:
```
"jappleseed" = {
    first_name = "Johnathan"
    groups     = ["read_only","2fa"]
    last_name  = "Appleseed"
    policies   = []
    team       = "developers"
    username   = "jappleseed"
}
```
- once this updated configuration is pushed to the `main` branch, the `.github/workflows/terraform.yml` workflow will pick it up and create the role `developer` in AWS