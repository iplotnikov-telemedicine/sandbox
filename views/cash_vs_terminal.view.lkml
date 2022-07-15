# The name of this view in Looker is "Cash Vs Terminal"
view: cash_vs_terminal {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_tmp.cash_vs_terminal ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel ID" in Explore.

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

  dimension: checkout_seconds {
    hidden: yes
    type: number
    sql: ${TABLE}.checkout_seconds ;;
  }

  measure: total_checkout_seconds {
    type: sum
    sql: ${checkout_seconds} ;;
  }

  measure: avg_checkout_seconds {
    type: number
    sql: ${total_checkout_seconds}/${total_order_quantity}/86400 ;;
    value_format: "mm:ss"
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: order_item_quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.order_item_quantity ;;
  }

  measure: total_order_item_quantity {
    type: sum
    sql: ${order_item_quantity} ;;
  }

  dimension: order_quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.order_quantity ;;
  }

  measure: total_order_quantity {
    type: sum
    sql: ${order_quantity} ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: report_month {
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
    sql: ${TABLE}.report_month ;;
  }

  dimension: sales_volume {
    type: number
    sql: ${TABLE}.sales_volume ;;
  }

  measure: total_sales_volume {
    type: sum
    sql: ${sales_volume} ;;
  }

  measure: avg_order_amount {
    type: number
    sql:  ${total_sales_volume} / ${total_order_quantity} ;;
    value_format_name: usd
  }

  measure: avg_order_items {
    type: number
    sql:  ${total_order_item_quantity} / ${total_order_quantity} ;;
    value_format_name: decimal_1
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

}
