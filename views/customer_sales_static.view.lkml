# The name of this view in Looker is "Customer Sales Static"
view: customer_sales_static {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_tmp.customer_sales_static ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel" in Explore.

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: is_sweede {
    type: yesno
    sql: ${channel} = "sweede" ;;
  }

  # dimension: custom_channel {
  # # in-store
  #   type: string
  #   case: {
  #     when: {
  #       sql: ${channel} = "sweede" and ${type} = "pickup" ;;
  #       label: "pick-up: from Sweede"
  #     }
  #     when: {
  #       sql: ${channel} <> "sweede" and ${type} = "pickup" ;;
  #       label: "pick-up: NOT from Sweede"
  #     }
  #     when: {
  #       sql: ${channel} = "sweede" and ${type} = "delivery" ;;
  #       label: "delivery: from Sweede"
  #     }
  #     when: {
  #       sql: ${channel} <> "sweede" and ${type} = "delivery" ;;
  #       label: "delivery: NOT from Sweede"
  #     else: "Label If No Condition Met"
  #   }
  # }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: comp_name {
    type: string
    sql: ${TABLE}.comp_name ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension: report_month {
    type: number
    sql: ${TABLE}.report_month ;;
  }

  dimension: report_year {
    type: number
    sql: ${TABLE}.report_year ;;
  }

  dimension: sales_volume {
    hidden: yes
    type: number
    sql: ${TABLE}.sales_vol_after_tax ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: type {
    # delivery
    # mail_delivery
    # none
    # on_demand
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: total_sales_volume {
    type: sum
    sql:  ${sales_volume};;
    value_format_name: usd_0
    drill_fields: [comp_name, state_name]
  }
}
