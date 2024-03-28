/* 
 This file is used to create and manage users. A map allows for each user to be defined with a set of attributes. 
 The snowflake_user resource is then used to create the users in Snowflake.
 Use this to create users within Snowflake. No permissions have been assigned and the assumption is that the users 
 will log in using SSO. For login with key pair, see apps.tf. For access with password, simply add a 'password = xyz' 
 section to each user, and a 'password = each.value.password' to the resource.

 If using passwords, it would be best practice to also ensure the option to change password on first login was set. 
 Remember, putting passwords in here isn't great! 
*/
locals {
    users_sso = {
        "ANTHONY_DAVIS" = {
            display_name = "ANTHONY DAVIS"
            first_name = "anthony"
            last_name = "davis"
            email = "anthony.davis@gmail.com"
            login_name = "anthony.davis@gmail.com"
            disabled = false
            business = "lakers"
            is_business_user = false
            role = "center_engineer" # this could be an enum
        },
        "DONOVAN_MITCHEL" = {
            display_name = "DONOVAN MITCHEL"
            first_name = "donovan"
            last_name = "mitchel"
            email = "donovan.mitchel@gmail.com"
            login_name = "donovan.mitchel@gmail.com"
            disabled = false
            business = "cavaliers"
            is_business_user = false
            role = "shooting_engineer" # this could be an enum
        }
        "RASHID_MOHAMMED" = {
            display_name = "RASHID MOHAMMED"
            first_name = "rashid"
            last_name = "mohammed"
            email = "rashid.mohammed@gmail.com"
            login_name = "rashid.mohammed@gmail.com"
            disabled = false
            business = "celtics"
            is_business_user = false
            role = "shooting_engineer" # this could be an enum
        }
        "LUKA_DONCIC" = {
            display_name = "LUCA DONCIC"
            first_name = "luca"
            last_name = "doncic"
            email = "luca.doncic@gmail.com"
            login_name = "luca.doncic@gmail.com"
            disabled = false
            business = "mavericks"
            is_business_user = false
            role = "pf_engineer" # this could be an enum
        }
        "KYRIE_IRVING" = {
            display_name = "KYRIE IRVING"
            first_name = "kyrie"
            last_name = "irving"
            email = "kyrie.irving@gmail.com"
            login_name = "kyrie.irving@gmail.com"
            disabled = false
            business = "asset_management"
            is_business_user = false
            role = "guard_engineer" # this could be an enum
        }
        "WILT_CHAMBERLAINE" = {
            display_name = "WILT CHAMBERLAINE"
            first_name = "wilt"
            last_name = "chamberlaine"
            email = "wilt.chamberlaine@gmail.com"
            login_name = "wilt.chamberlaine@gmail.com"
            disabled = false
            business = "mamoney"
            is_business_user = true
            role = "generic_business_user" # this could be an enum
        }
    }
}

resource "snowflake_user" "users_sso" {
    provider = snowflake.user_admin
    for_each =local.users_sso 
    name = each.key
    display_name = each.value.display_name
    first_name = each.value.first_name
    last_name = each.value.last_name
    email = each.value.email
    login_name = each.value.login_name
    disabled = each.value.disabled
}

