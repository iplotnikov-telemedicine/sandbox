# The name of this view in Looker is "Package"
view: package {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: backend.package ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Available Couriers Count" in Explore.

  # dimension: available_couriers_count {
  #   type: number
  #   sql: ${TABLE}.available_couriers_count ;;
  # }

  # dimension: available_doctors_count {
  #   type: number
  #   sql: ${TABLE}.available_doctors_count ;;
  # }

  # dimension: available_locations_count {
  #   type: number
  #   sql: ${TABLE}.available_locations_count ;;
  # }

  # dimension: available_ondemand_offices_count {
  #   type: number
  #   sql: ${TABLE}.available_ondemand_offices_count ;;
  # }

  # dimension: available_ondemand_storages_count {
  #   type: number
  #   sql: ${TABLE}.available_ondemand_storages_count ;;
  # }

  # dimension: available_registers_count {
  #   type: number
  #   sql: ${TABLE}.available_registers_count ;;
  # }

  # dimension: available_staff_count {
  #   type: number
  #   sql: ${TABLE}.available_staff_count ;;
  # }

  # dimension: available_storages_count {
  #   type: number
  #   sql: ${TABLE}.available_storages_count ;;
  # }

  # dimension: available_tv_devices_count {
  #   type: number
  #   sql: ${TABLE}.available_tv_devices_count ;;
  # }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: full_description {
    type: string
    sql: ${TABLE}.full_description ;;
  }

  dimension: subscription_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  # dimension: php_class {
  #   type: string
  #   sql: ${TABLE}.php_class ;;
  # }

  # dimension: price {
  #   type: number
  #   sql: ${TABLE}.price ;;
  # }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  # measure: total_price {
  #   type: sum
  #   sql: ${price} ;;
  # }

  # measure: average_price {
  #   type: average
  #   sql: ${price} ;;
  # }

  # dimension: project_id {
  #   type: number
  #   sql: ${TABLE}.project_id ;;
  # }

  # dimension: recurly_plan_code {
  #   type: string
  #   sql: ${TABLE}.recurly_plan_code ;;
  # }

}
