roles = {
"EKS_Production_Node_Group_Role" = {
    assume_role_policy_name = "ec2_assume_role"
    environment             = "production"
    name                    = "EKS_Production_Node_Group_Role"
    policies                = ["eks_ec2_nodes", "eks_ecr_ec2_nodes"]
    purpose                 = "allows the worker nodes (EC2 instances) to communicate with the EKS control plane and perform necessary operations such as interacting with Amazon ECR to pull container images and managing EC2 and load balancer resources"
    },
"EKS_Production_Role" = {
    assume_role_policy_name = "eks_assume_role"
    environment             = "production"
    name                    = "EKS_Production_Role"
    policies                = ["eks_cluster"]
    purpose                 = "allows the Amazon EKS control plane to manage the EKS cluster. This role includes permissions to create, delete, describe, list, and update the cluster and its configuration"
    },
"GitHubActionRunner" = {
    assume_role_policy_name = "github"
    environment             = "shared"
    name                    = "GitHubActionRunner"
    policies                = ["admin"]
    purpose                 = "facilitate github interactions with aws"
    }
} 