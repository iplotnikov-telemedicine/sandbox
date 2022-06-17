# The name of this view in Looker is "Warehouse Orders"
view: warehouse_orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: c3628_company.warehouse_orders ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: amount_sum {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

  dimension: applied_potify_credits {
    type: number
    sql: ${TABLE}.applied_potify_credits ;;
  }

  dimension: asap_delivery {
    type: yesno
    sql: ${TABLE}.asap_delivery ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: cashier_id {
    type: number
    sql: ${TABLE}.cashier_id ;;
  }

  dimension: cashier_name {
    type: string
    sql: ${TABLE}.cashier_name ;;
  }

  dimension: change_amount {
    type: number
    sql: ${TABLE}.change_amount ;;
  }

  dimension: charge_by {
    type: string
    sql: ${TABLE}.charge_by ;;
  }

  dimension: checkout_staff_id {
    type: number
    sql: ${TABLE}.checkout_staff_id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: completed {
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
    sql: ${TABLE}.completed_at ;;
  }

  dimension_group: confirmed {
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
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension: courier_id {
    type: number
    sql: ${TABLE}.courier_id ;;
  }

  dimension: courier_name {
    type: string
    sql: ${TABLE}.courier_name ;;
  }

  dimension: courier_number {
    type: string
    sql: ${TABLE}.courier_number ;;
  }

  dimension: courier_register_id {
    type: number
    sql: ${TABLE}.courier_register_id ;;
  }

  dimension: courier_register_name {
    type: string
    sql: ${TABLE}.courier_register_name ;;
  }

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

  dimension: custom_discount_type {
    type: number
    sql: ${TABLE}.custom_discount_type ;;
  }

  dimension: custom_discount_type_bak {
    type: string
    sql: ${TABLE}.custom_discount_type_bak ;;
  }

  dimension: custom_discount_value {
    type: number
    sql: ${TABLE}.custom_discount_value ;;
  }

  dimension: delivery_address {
    type: string
    sql: ${TABLE}.delivery_address ;;
  }

  dimension: delivery_address_id {
    type: number
    sql: ${TABLE}.delivery_address_id ;;
  }

  dimension: delivery_city {
    type: string
    sql: ${TABLE}.delivery_city ;;
  }

  dimension_group: delivery_datetime {
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
    sql: ${TABLE}.delivery_datetime ;;
  }

  dimension_group: delivery_estimated_time_of_arrival {
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
    sql: ${TABLE}.delivery_estimated_time_of_arrival ;;
  }

  dimension: delivery_latitude {
    type: number
    sql: ${TABLE}.delivery_latitude ;;
  }

  dimension: delivery_longitude {
    type: number
    sql: ${TABLE}.delivery_longitude ;;
  }

  dimension: delivery_method {
    type: string
    sql: ${TABLE}.delivery_method ;;
  }

  dimension: delivery_phone {
    type: string
    sql: ${TABLE}.delivery_phone ;;
  }

  dimension: delivery_state {
    type: string
    sql: ${TABLE}.delivery_state ;;
  }

  dimension: delivery_zip {
    type: string
    sql: ${TABLE}.delivery_zip ;;
  }

  dimension: discount_has_changed {
    type: yesno
    sql: ${TABLE}.discount_has_changed ;;
  }

  dimension: discount_id {
    type: number
    sql: ${TABLE}.discount_id ;;
  }

  dimension: discount_type_bak {
    type: string
    sql: ${TABLE}.discount_type_bak ;;
  }

  dimension: fulfillment_status {
    type: number
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: is_bonus_point_as_discount {
    type: yesno
    sql: ${TABLE}.is_bonus_point_as_discount ;;
  }

  dimension: is_shipped {
    type: yesno
    sql: ${TABLE}.is_shipped ;;
  }

  dimension: is_transit_started {
    type: yesno
    sql: ${TABLE}.is_transit_started ;;
  }

  dimension: is_verified_by_courier {
    type: yesno
    sql: ${TABLE}.is_verified_by_courier ;;
  }

  dimension: marketplace {
    type: number
    sql: ${TABLE}.marketplace ;;
  }

  dimension: method1_amount {
    type: number
    sql: ${TABLE}.method1_amount ;;
  }

  dimension: method2_amount {
    type: number
    sql: ${TABLE}.method2_amount ;;
  }

  dimension: method3_amount {
    type: number
    sql: ${TABLE}.method3_amount ;;
  }

  dimension: method4_amount {
    type: number
    sql: ${TABLE}.method4_amount ;;
  }

  dimension: method5_amount {
    type: number
    sql: ${TABLE}.method5_amount ;;
  }

  dimension: method6_amount {
    type: number
    sql: ${TABLE}.method6_amount ;;
  }

  dimension: method7_amount {
    type: number
    sql: ${TABLE}.method7_amount ;;
  }

  dimension: metrc_delivery_status {
    type: string
    sql: ${TABLE}.metrc_delivery_status ;;
  }

  dimension: metrc_status {
    type: string
    sql: ${TABLE}.metrc_status ;;
  }

  dimension: metrc_substatus {
    type: string
    sql: ${TABLE}.metrc_substatus ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: office_zip_name {
    type: string
    sql: ${TABLE}.office_zip_name ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: patient_has_caregiver {
    type: yesno
    sql: ${TABLE}.patient_has_caregiver ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: patient_is_tax_exempt {
    type: yesno
    sql: ${TABLE}.patient_is_tax_exempt ;;
  }

  dimension: patient_rec_number {
    type: string
    sql: ${TABLE}.patient_rec_number ;;
  }

  dimension: patient_type {
    type: number
    sql: ${TABLE}.patient_type ;;
  }

  dimension: payment_status {
    type: string
    sql: ${TABLE}.payment_status ;;
  }

  dimension: photo {
    type: string
    sql: ${TABLE}.photo ;;
  }

  dimension_group: placed {
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
    sql: ${TABLE}.placed_at ;;
  }

  dimension: pos_mode {
    type: string
    sql: ${TABLE}.pos_mode ;;
  }

  dimension: preferred_payment_method {
    type: number
    sql: ${TABLE}.preferred_payment_method ;;
  }

  dimension: processing_register_id {
    type: number
    sql: ${TABLE}.processing_register_id ;;
  }

  dimension: referral_discount_type {
    type: number
    sql: ${TABLE}.referral_discount_type ;;
  }

  dimension: referral_discount_value {
    type: number
    sql: ${TABLE}.referral_discount_value ;;
  }

  dimension: refund_type {
    type: string
    sql: ${TABLE}.refund_type ;;
  }

  dimension: register_id {
    type: number
    sql: ${TABLE}.register_id ;;
  }

  dimension: register_name {
    type: string
    sql: ${TABLE}.register_name ;;
  }

  dimension: resend_staff_id {
    type: number
    sql: ${TABLE}.resend_staff_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: shipment_status {
    type: string
    sql: ${TABLE}.shipment_status ;;
  }

  dimension: shipping_amount {
    type: number
    sql: ${TABLE}.shipping_amount ;;
  }

  dimension: shipping_method_id {
    type: number
    sql: ${TABLE}.shipping_method_id ;;
  }

  dimension: shipping_method_name {
    type: string
    sql: ${TABLE}.shipping_method_name ;;
  }

  dimension: shipping_tracking_number {
    type: string
    sql: ${TABLE}.shipping_tracking_number ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sum_discount {
    type: number
    sql: ${TABLE}.sum_discount ;;
  }

  dimension: sum_free_discount {
    type: number
    sql: ${TABLE}.sum_free_discount ;;
  }

  dimension: sum_income {
    type: number
    sql: ${TABLE}.sum_income ;;
  }

  dimension: sum_tax {
    type: number
    sql: ${TABLE}.sum_tax ;;
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

  dimension: tax_tier_version_id {
    type: number
    sql: ${TABLE}.tax_tier_version_id ;;
  }

  dimension: tip_amount {
    type: number
    sql: ${TABLE}.tip_amount ;;
  }

  measure: total_amount_sum {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated_at {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: vehicle {
    type: string
    sql: ${TABLE}.vehicle ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      register_name,
      cashier_name,
      courier_name,
      shipping_method_name,
      office_zip_name,
      courier_register_name
    ]
  }
}
