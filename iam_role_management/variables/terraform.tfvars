roles = {
"GitHubAction-AssumeRoleWithAction" = {
    assume_role_policy_name = "github"
    environment             = "shared"
    name                    = "GitHubAction-AssumeRoleWithAction"
    policies                = ["admin"]
    purpose                 = "facilitate github interactions with aws"

    }
}