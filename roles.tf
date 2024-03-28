# All snowflake roles (across all business)
locals {
    business = {
        lakers = {
            team_roles = {
                "data_engineer_funcrole" = {
                    comment = "Data engineers in mamoney should be assigned this role" 
                }

                "analytics_engineer_funcrole" = {
                    comment = "Data engineers in mamoney should be assigned this role"
                }

                "data_analyst_funcrole" = {
                    comment = "Data engineers in mamoney should be assigned this role"
                }
            }

            app_roles = {
                "svc_role_dbt_non_prod" = {
                    comment = "Assumed by dbt in dbt cloud when running jobs in the non-production environment"
                }

                "svc_role_dbt_prod" = {
                    comment = "Assumed by dbt in dbt cloud when running jobs in the production environment"
                }
            }

            business_roles = {
                "wilt_chamberlaine_role" = {
                    comment = "Bespoke role created for Wilt Chamberlaine"
                }
            }
        }

        celtics = {
            team_roles = {
                "data_engineer_funcrole" = {
                    comment = "Data engineers in mamoney should be assigned this role"
                }

                "analytics_engineer_funcrole" = {
                    comment = "Data engineers in corporate should be assigned this role"
                }

                "data_analyst_funcrole" = {
                    comment = "Data engineers in corporate should be assigned this role"
                }
            }
        }

        mavericks = {
            team_roles = {
                "data_engineer_funcrole" = {
                    comment = "Data engineers in mamoney should be assigned this role"
                }

                "analytics_engineer_funcrole" = {
                    comment = "Data engineers in asset_management should be assigned this role"
                }

                "data_analyst_funcrole" = {
                    comment = "Data engineers in asset_management should be assigned this role"
                }
            }
        }
    }
}


# Create team roles 
resource "snowflake_role" "lakers_team_roles" {
    provider = snowflake.security_admin
    for_each = local.business.mamoney.team_roles
    name = "lakers_${each.key}" # e.g. lakers_data_engineer_funcrole
    depends_on = [ local.users_sso ]
    comment = each.value.comment
}

resource "snowflake_role" "mavericks_team_roles" {
    provider = snowflake.security_admin
    for_each = local.business.corporate.team_roles
    name = "mavericks_${each.key}"
    depends_on = [ local.users_sso ]
    comment = each.value.comment
}

resource "snowflake_role" "celtics_team_roles" {
    provider = snowflake.security_admin
    for_each = local.business.asset_management.team_roles
    name = "celtics_${each.key}"
    depends_on = [ local.users_sso ]
    comment = each.value.comment
}