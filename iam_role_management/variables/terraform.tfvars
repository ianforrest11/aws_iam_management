roles = {
"GitHubAction-AssumeRoleWithAction" = {
    assume_role_policy_name = "github"
    environment             = "shared"
    name                    = "GitHubAction-AssumeRoleWithAction"
    policies                = ["arn:aws:iam::128333337075:policy/admin"]
    purpose                 = "facilitate github interactions with aws"
    }
} 