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
- To use, navigate to iam_group_management/variables/terraform.tfvars and add a new key into the `groups` object map
```
hi
```

