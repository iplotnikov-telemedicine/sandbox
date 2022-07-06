# The name of this view in Looker is "Customer Sales Static"
view: customer_sales_static {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_tmp.customer_sales ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel" in Explore.

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: channel_id {
    hidden: yes
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: channel {
    type: string
    case: {
      when: {
        sql: ${TABLE}.channel_id = 1 ;;
        label: "POS"
      }
      when: {
        sql: ${TABLE}.channel_id = 2 ;;
        label: "e-commerce"
      }
      when: {
        sql: ${TABLE}.channel_id = 3 ;;
        label: "sweede"
      }
      when: {
        sql: ${TABLE}.channel_id = 4 ;;
        label: "offline POS"
      }
      when: {
        sql: ${TABLE}.channel_id = 5 ;;
        label: "weedmaps"
      }
      when: {
        sql: ${TABLE}.channel_id = 6 ;;
        label: "openAPI"
      }
    }
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

  dimension_group: report_month {
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.report_month ;;
  }

  # dimension: sales_volume {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.sales_volume ;;
  # }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: min_report_month {
    type: date
    sql: MIN(${TABLE}.report_month) ;;
    convert_tz: no
  }

  measure: max_report_month {
    type: date
    sql: MAX(${TABLE}.report_month) ;;
    convert_tz: no
  }

  measure: months_with_io {
    type: number
    sql: PERIOD_DIFF(DATE_FORMAT(${max_report_month}, "%Y%m"), DATE_FORMAT(${min_report_month}, "%Y%m")) + 1 ;;
  }

  measure: total_sales_volume {
    type: sum
    sql:  ${TABLE}.sales_volume;;
    value_format_name: usd_0
  }

  measure: delivery_sales_volume {
    type: sum
    sql:  ${TABLE}.sales_volume;;
    value_format_name: usd_0
    filters: [type: "delivery"]
  }

  measure: walkin_sales_volume {
    type: sum
    sql:  ${TABLE}.sales_volume;;
    value_format_name: usd_0
    filters: [type: "walkin"]
  }

  measure: sweede_sales_offices_count {
    type: count_distinct
    sql:  ${office_id};;
    filters: [channel: "sweede"]
  }

}
