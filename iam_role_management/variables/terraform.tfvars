roles = {
"GitHubActionRole" = {
    assume_role_policy_name = "github"
    environment             = "shared"
    name                    = "GitHubActionRole"
    policies                = ["admin"]
    purpose                 = "facilitate github interactions with aws"

    }
}