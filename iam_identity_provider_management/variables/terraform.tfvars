identity_provider_github = {
  client_id_list  = ["sts.amazonaws.com"]
  provider_url    = "https://token.actions.githubusercontent.com"
  thumbprint_list = ["1b511abead59c6ce207077c0bf0e0043b1382612"]
}

identity_provider_circleci = {
  client_id_list  = ["4a4fa3ae-7cdd-46ee-9587-e132cd872462"]
  provider_url    = "https://oidc.circleci.com/org/4a4fa3ae-7cdd-46ee-9587-e132cd872462"
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
}