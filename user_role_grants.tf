# Grant roles to users
# E.g. grant the lakers_analytics_engineer_funcrole to all data engineers
# in lakers

resource "snowflake_role_grants" "grant_roles_to_mamoney_analytics_engineers" {
  role_name = "lakers_analytics_engineer_funcrole"
  provider = snowflake.security_admin
  depends_on = [ snowflake_role.lakers_team_roles ]
  users = [
    for user_name, user_details in local.users_sso: user_name
    if user_details.business == "lakers" && user_details.role == "analytics_engineer" && user_details.is_business_user == false
  ]
}


resource "snowflake_role_grants" "grant_roles_to_lakers_analytics_engineers" {
  role_name = "lakers_engineer_funcrole"
  provider = snowflake.security_admin
  depends_on = [ snowflake_role.lakers_team_roles ]
  users = [
    for user_name, user_details in local.users_sso: user_name
    if user_details.business == "lakers" && user_details.role == "engineer" && user_details.is_business_user == false
  ]
}