# The name of this view in Looker is "Companies"
view: companies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: backend.companies ;;
  drill_fields: [agilecrm_company_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: agilecrm_company_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.agilecrm_company_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Address1" in Explore.


  dimension: is_active {
    type: yesno
    sql: ${TABLE}.comp_is_approved = 1
     and ${TABLE}.comp_is_disabled = 0
     and ${TABLE}.is_blank = 0
     and ${TABLE}.state_name = 'CA'
     and ${TABLE}.comp_email not like '%maildrop%'
     and ${TABLE}.comp_name not like '%test%'
     and ${TABLE}.comp_name not like 'xxxx%'
     and ${TABLE}.comp_project = 'Indica'
     and ${TABLE}.plan != 5 ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: agilecrm_admin_contact_id {
    type: number
    sql: ${TABLE}.agilecrm_admin_contact_id ;;
  }

  dimension: agilecrm_email {
    type: string
    sql: ${TABLE}.agilecrm_email ;;
  }

  dimension: allow_multiactivation {
    type: yesno
    sql: ${TABLE}.allow_multiactivation ;;
  }

  dimension: auto_approve_rec {
    type: yesno
    sql: ${TABLE}.auto_approve_rec ;;
  }

  dimension: autologin_hash {
    type: string
    sql: ${TABLE}.autologin_hash ;;
  }

  dimension: business_type {
    type: string
    sql: ${TABLE}.business_type ;;
  }

  dimension: city_id {
    type: number
    sql: ${TABLE}.city_id ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: code_build_name {
    type: string
    sql: ${TABLE}.code_build_name ;;
  }

  dimension: code_stage {
    type: string
    sql: ${TABLE}.code_stage ;;
  }

  dimension: comp_allowed_rec {
    type: string
    sql: ${TABLE}.comp_allowed_rec ;;
  }

  dimension: comp_backup_domain {
    type: string
    sql: ${TABLE}.comp_backup_domain ;;
  }

  dimension: comp_db_charset {
    type: string
    sql: ${TABLE}.comp_db_charset ;;
  }

  dimension: comp_db_host {
    type: string
    sql: ${TABLE}.comp_db_host ;;
  }

  dimension: comp_db_name {
    type: string
    sql: ${TABLE}.comp_db_name ;;
  }

  dimension: comp_db_pswd {
    type: string
    sql: ${TABLE}.comp_db_pswd ;;
  }

  dimension: comp_db_user {
    type: string
    sql: ${TABLE}.comp_db_user ;;
  }

  dimension: comp_descr {
    type: string
    sql: ${TABLE}.comp_descr ;;
  }

  dimension: comp_domain {
    type: string
    sql: ${TABLE}.comp_domain ;;
  }

  dimension: comp_email {
    type: string
    sql: ${TABLE}.comp_email ;;
  }

  dimension: comp_google_api_key {
    type: string
    sql: ${TABLE}.comp_google_api_key ;;
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: comp_is_approved {
    type: yesno
    sql: ${TABLE}.comp_is_approved ;;
  }

  dimension: comp_is_disabled {
    type: yesno
    sql: ${TABLE}.comp_is_disabled ;;
  }

  dimension: comp_location_type {
    type: string
    sql: ${TABLE}.comp_location_type ;;
  }

  dimension: comp_mrn {
    type: number
    sql: ${TABLE}.comp_mrn ;;
  }

  dimension: comp_name {
    type: string
    sql: ${TABLE}.comp_name ;;
  }

  dimension: comp_project {
    type: string
    sql: ${TABLE}.comp_project ;;
  }

  dimension: comp_soap_key {
    type: string
    sql: ${TABLE}.comp_soap_key ;;
  }

  dimension: comp_soap_salt {
    type: string
    sql: ${TABLE}.comp_soap_salt ;;
  }

  dimension: comp_type {
    type: string
    sql: ${TABLE}.comp_type ;;
  }

  dimension: comp_user_id {
    type: number
    sql: ${TABLE}.comp_user_id ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
  }

  dimension: county_id {
    type: number
    sql: ${TABLE}.county_id ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.county_name ;;
  }

  dimension: courier_limit {
    type: number
    sql: ${TABLE}.courier_limit ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: currently_operating {
    type: string
    sql: ${TABLE}.currently_operating ;;
  }

  dimension: db_name {
    type: string
    sql: ${TABLE}.db_name ;;
  }

  dimension: doctors_count {
    type: number
    sql: ${TABLE}.doctors_count ;;
  }

  dimension: dollars_to_points {
    type: number
    sql: ${TABLE}.dollars_to_points ;;
  }

  dimension: domain_prefix {
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }

  dimension: earn_potify_credits_for_instore_orders {
    type: yesno
    sql: ${TABLE}.earn_potify_credits_for_instore_orders ;;
  }

  dimension: employees {
    type: string
    sql: ${TABLE}.employees ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: free_email_limit {
    type: number
    sql: ${TABLE}.free_email_limit ;;
  }

  dimension: full_address {
    type: string
    sql: ${TABLE}.full_address ;;
  }

  dimension: google_directions_api_key {
    type: string
    sql: ${TABLE}.google_directions_api_key ;;
  }

  dimension: google_geocoding_api_key {
    type: string
    sql: ${TABLE}.google_geocoding_api_key ;;
  }

  dimension: has_unpaid_invoice {
    type: yesno
    sql: ${TABLE}.has_unpaid_invoice ;;
  }

  dimension: hear_about_us {
    type: string
    sql: ${TABLE}.hear_about_us ;;
  }

  dimension: in_app_receipt {
    type: string
    sql: ${TABLE}.in_app_receipt ;;
  }

  dimension: invoicera_client_id {
    type: number
    sql: ${TABLE}.invoicera_client_id ;;
  }

  dimension: invoicera_invoice_id {
    type: number
    sql: ${TABLE}.invoicera_invoice_id ;;
  }

  dimension: is_active_points_program {
    type: yesno
    sql: ${TABLE}.is_active_points_program ;;
  }

  dimension: is_allow_inventory_migration {
    type: yesno
    sql: ${TABLE}.is_allow_inventory_migration ;;
  }

  dimension: is_apple_pay {
    type: yesno
    sql: ${TABLE}.is_apple_pay ;;
  }

  dimension: is_automatically_finish_metrc_packages {
    type: yesno
    sql: ${TABLE}.is_automatically_finish_metrc_packages ;;
  }

  dimension: is_blank {
    type: yesno
    sql: ${TABLE}.is_blank ;;
  }

  dimension: is_create_zenmd_patients {
    type: yesno
    sql: ${TABLE}.is_create_zenmd_patients ;;
  }

  dimension: is_delivery {
    type: yesno
    sql: ${TABLE}.is_delivery ;;
  }

  dimension: is_enabled_empty_phone_and_email_notifications {
    type: yesno
    sql: ${TABLE}.is_enabled_empty_phone_and_email_notifications ;;
  }

  dimension: is_enabled_fulfillment {
    type: yesno
    sql: ${TABLE}.is_enabled_fulfillment ;;
  }

  dimension: is_enabled_metrc_delivery_sales {
    type: yesno
    sql: ${TABLE}.is_enabled_metrc_delivery_sales ;;
  }

  dimension: is_enabled_order_potify_notification {
    type: yesno
    sql: ${TABLE}.is_enabled_order_potify_notification ;;
  }

  dimension: is_enabled_powered_by_line_in_receipt {
    type: yesno
    sql: ${TABLE}.is_enabled_powered_by_line_in_receipt ;;
  }

  dimension: is_enabled_sms_integration {
    type: yesno
    sql: ${TABLE}.is_enabled_sms_integration ;;
  }

  dimension: is_hide_in_search_on_potify {
    type: yesno
    sql: ${TABLE}.is_hide_in_search_on_potify ;;
  }

  dimension: is_marked_for_deletion {
    type: yesno
    sql: ${TABLE}.is_marked_for_deletion ;;
  }

  dimension: is_metrc_enabled {
    type: yesno
    sql: ${TABLE}.is_metrc_enabled ;;
  }

  dimension: is_patients_recs_manage_lite {
    type: yesno
    sql: ${TABLE}.is_patients_recs_manage_lite ;;
  }

  dimension: is_potify_create_patient {
    type: yesno
    sql: ${TABLE}.is_potify_create_patient ;;
  }

  dimension: is_recurly_dunning_last {
    type: yesno
    sql: ${TABLE}.is_recurly_dunning_last ;;
  }

  dimension: is_reserve_print {
    type: yesno
    sql: ${TABLE}.is_reserve_print ;;
  }

  dimension: is_signed_potify_client_credit_agreement {
    type: yesno
    sql: ${TABLE}.is_signed_potify_client_credit_agreement ;;
  }

  dimension: is_skip_patients_add_step {
    type: yesno
    sql: ${TABLE}.is_skip_patients_add_step ;;
  }

  dimension: is_valid_limits {
    type: yesno
    sql: ${TABLE}.is_valid_limits ;;
  }

  dimension: is_verification_disabled {
    type: yesno
    sql: ${TABLE}.is_verification_disabled ;;
  }

  dimension: is_verification_myrec_disabled {
    type: yesno
    sql: ${TABLE}.is_verification_myrec_disabled ;;
  }

  dimension: last_limits_audit_log_id {
    type: number
    sql: ${TABLE}.last_limits_audit_log_id ;;
  }

  dimension_group: limits_validated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.limits_validated_at ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: locations_count {
    type: number
    sql: ${TABLE}.locations_count ;;
  }

  dimension: ondemand_offices_count {
    type: number
    sql: ${TABLE}.ondemand_offices_count ;;
  }

  dimension: ondemand_storages_count {
    type: number
    sql: ${TABLE}.ondemand_storages_count ;;
  }

  dimension: paid_email_limit {
    type: number
    sql: ${TABLE}.paid_email_limit ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: plan_to_use {
    type: string
    sql: ${TABLE}.plan_to_use ;;
  }

  dimension: points_per_referral {
    type: number
    sql: ${TABLE}.points_per_referral ;;
  }

  dimension: points_to_dollars {
    type: number
    sql: ${TABLE}.points_to_dollars ;;
  }

  dimension: potify_earned_cashback {
    type: number
    sql: ${TABLE}.potify_earned_cashback ;;
  }

  dimension: potify_pending_cashback {
    type: number
    sql: ${TABLE}.potify_pending_cashback ;;
  }

  dimension: potify_spent_cashback {
    type: number
    sql: ${TABLE}.potify_spent_cashback ;;
  }

  dimension_group: potify_sync_entity_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.potify_sync_entity_created_at ;;
  }

  dimension_group: potify_sync_entity_deleted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.potify_sync_entity_deleted_at ;;
  }

  dimension_group: potify_sync_entity_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.potify_sync_entity_updated_at ;;
  }

  dimension: project_type {
    type: string
    sql: ${TABLE}.project_type ;;
  }

  dimension: recurly_account_id {
    type: string
    sql: ${TABLE}.recurly_account_id ;;
  }

  dimension_group: recurly_dunning {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.recurly_dunning_at ;;
  }

  dimension_group: recurly_expired {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.recurly_expired_at ;;
  }

  dimension: recurly_hosted_login_token {
    type: string
    sql: ${TABLE}.recurly_hosted_login_token ;;
  }

  dimension: recurly_subscription_id {
    type: string
    sql: ${TABLE}.recurly_subscription_id ;;
  }

  dimension_group: recurly_trial_expired {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.recurly_trial_expired_at ;;
  }

  dimension: recurly_unpaid_invoice_id {
    type: string
    sql: ${TABLE}.recurly_unpaid_invoice_id ;;
  }

  dimension: recurly_unpaid_invoice_number {
    type: number
    sql: ${TABLE}.recurly_unpaid_invoice_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_recurly_unpaid_invoice_number {
    type: sum
    sql: ${recurly_unpaid_invoice_number} ;;
  }

  measure: average_recurly_unpaid_invoice_number {
    type: average
    sql: ${recurly_unpaid_invoice_number} ;;
  }

  dimension: ref_number {
    type: number
    sql: ${TABLE}.ref_number ;;
  }

  dimension: register_limit {
    type: number
    sql: ${TABLE}.register_limit ;;
  }

  dimension: reserve_print_limit {
    type: number
    sql: ${TABLE}.reserve_print_limit ;;
  }

  dimension: reserve_print_price {
    type: number
    sql: ${TABLE}.reserve_print_price ;;
  }

  dimension: scan_resolution {
    type: string
    sql: ${TABLE}.scan_resolution ;;
  }

  dimension: security_password_hash {
    type: string
    sql: ${TABLE}.security_password_hash ;;
  }

  dimension: setup_completed_step {
    type: yesno
    sql: ${TABLE}.setup_completed_step ;;
  }

  dimension: show_dashboard_steps {
    type: yesno
    sql: ${TABLE}.show_dashboard_steps ;;
  }

  dimension: sms_limit {
    type: number
    sql: ${TABLE}.sms_limit ;;
  }

  dimension: sparkpost_subaccount_api_key {
    type: string
    sql: ${TABLE}.sparkpost_subaccount_api_key ;;
  }

  dimension: staff_count {
    type: number
    sql: ${TABLE}.staff_count ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.state_id ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: storages_count {
    type: number
    sql: ${TABLE}.storages_count ;;
  }

  dimension: switch_code {
    type: number
    sql: ${TABLE}.switch_code ;;
  }

  dimension_group: sync_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sync_created_at ;;
  }

  dimension_group: sync_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sync_updated_at ;;
  }

  dimension_group: temporary_access_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.temporary_access_datetime ;;
  }

  dimension_group: terms_of_service_sign {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.terms_of_service_sign_date ;;
  }

  dimension: terms_of_service_sign_user_id {
    type: number
    sql: ${TABLE}.terms_of_service_sign_user_id ;;
  }

  dimension: terms_of_service_sign_user_login {
    type: string
    sql: ${TABLE}.terms_of_service_sign_user_login ;;
  }

  dimension: terms_of_service_sign_user_name {
    type: string
    sql: ${TABLE}.terms_of_service_sign_user_name ;;
  }

  dimension: timezone_id {
    type: number
    sql: ${TABLE}.timezone_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: trial {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.trial_date ;;
  }

  dimension: tv_device_limit {
    type: number
    sql: ${TABLE}.tv_device_limit ;;
  }

  dimension: use_pos {
    type: string
    sql: ${TABLE}.use_pos ;;
  }

  dimension: use_special_dispensaries {
    type: yesno
    sql: ${TABLE}.use_special_dispensaries ;;
  }

  dimension: verification_type {
    type: string
    sql: ${TABLE}.verification_type ;;
  }

  dimension: wcii_apikey {
    type: string
    sql: ${TABLE}.wcii_apikey ;;
  }

  dimension: whmcs_client_id {
    type: number
    sql: ${TABLE}.whmcs_client_id ;;
  }

  dimension: zip_id {
    type: number
    sql: ${TABLE}.zip_id ;;
  }

  dimension: zip_name {
    type: string
    sql: ${TABLE}.zip_name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: running_count {
    type: running_total
    direction: "row"
    sql: ${count} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      agilecrm_company_id,
      db_name,
      comp_name,
      comp_db_name,
      state_name,
      county_name,
      city_name,
      zip_name,
      code_build_name,
      terms_of_service_sign_user_name
    ]
  }
}
