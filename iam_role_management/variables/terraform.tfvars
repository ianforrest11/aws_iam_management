roles = {
# "EKS_Production_Role" = {
#     assume_role_policy_name = "eks_assume_role"
#     environment             = "production"
#     name                    = "EKS_Production_Role"
#     policies                = ["arn:aws:iam::128333337075:policy/admin"]
#     purpose                 = "facilitate github interactions with aws"
#     },
"GitHubActionRunner" = {
    assume_role_policy_name = "github"
    environment             = "shared"
    name                    = "GitHubActionRunner"
    policies                = ["arn:aws:iam::128333337075:policy/admin"]
    purpose                 = "facilitate github interactions with aws"
    }
} 