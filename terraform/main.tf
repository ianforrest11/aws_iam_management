module "policies" {
  source = "./iam_policy"
}

module "iam_user_creation" {
  source = "./iam_user_creation"

  users = {
    "user_a" = {
      first_name = "Ian"
      last_name  = "Forrest"
      team       = "Admin"
      policies   = ["this_master", "this_2fa"]
    },
    "user_b" = {
      first_name = "Bob"
      last_name  = "Job"
      team       = "ReadOnly"
      policies   = ["this_readonly", "this_2fa"]
    }
  }
}