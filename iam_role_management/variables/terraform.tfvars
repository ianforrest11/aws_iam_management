roles = {
"EKS_Production_Node_Group_Role" = {
    assume_role_policy_name = "ec2_assume_role"
    environment             = "production"
    name                    = "EKS_Production_Node_Group_Role"
    policies                = [
        "AmazonEC2ContainerRegistryReadOnly",
        "AmazonEKS_CNI_Policy",
        "AmazonEKSWorkerNodePolicy"
        ]
    purpose                 = "allows the worker nodes and underlying EC2 instances to communicate with the EKS control plane and perform necessary operations such as interacting with Amazon ECR to pull container images and managing EC2 and load balancer resources"
    }, 
"EKS_Production_Role" = {
    assume_role_policy_name = "eks_assume_role"
    environment             = "production"
    name                    = "EKS_Production_Role"
    policies                = ["AmazonEKSClusterPolicy"]
    purpose                 = "allows the Amazon EKS control plane to manage the EKS cluster"
    },
"GitHubActionRunner" = {
    assume_role_policy_name = "github"
    environment             = "shared"
    name                    = "GitHubActionRunner"
    policies                = ["admin"]
    purpose                 = "facilitate github interactions with aws"
    },
"CircleCIRunner" = {
    assume_role_policy_name = "circleci"
    environment             = "shared"
    name                    = "CircleCIRunner"
    policies                = ["admin"]
    purpose                 = "facilitate CircleCI interactions with aws"
    }
} 