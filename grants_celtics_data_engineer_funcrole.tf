resource "snowflake_grant_privileges_to_account_role" "dvd_rentals_usage_to_celtics_data_engineer_funcrole" {
  provider = snowflake.security_admin
  privileges = ["USAGE"]
  account_role_name = "celtics_data_engineer_funcrole"
  depends_on = [ snowflake_role.celtics_team_roles ]
  on_account_object {
    object_type = "DATABASE"
    object_name = "DVD_RENTALS"
  }
}