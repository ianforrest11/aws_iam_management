groups = {
"admin" = {
    group_name = "admin"
    policies   = ["arn:aws:iam::128333337075:policy/admin"]
}
"read_only" = {
    group_name = "read_only"
    policies   = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
},
"2fa" = {
    group_name = "2fa"
    policies   = ["arn:aws:iam::128333337075:policy/2fa"]
}
}