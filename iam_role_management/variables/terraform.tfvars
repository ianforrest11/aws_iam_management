roles = {
"EKS_Production_Role" = {
    assume_role_policy_name = "eks_assume_role"
    environment             = "production"
    name                    = "EKS_Production_Role"
    policies                = ["eks_cluster", "eks_container_registry_read_only", "eks_service"]
    purpose                 = "facilitate github interactions with aws"
    },
"GitHubActionRunner" = {
    assume_role_policy_name = "github"
    environment             = "shared"
    name                    = "GitHubActionRunner"
    policies                = ["admin"]
    purpose                 = "facilitate github interactions with aws"
    }
} 