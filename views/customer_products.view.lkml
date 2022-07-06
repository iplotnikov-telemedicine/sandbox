# The name of this view in Looker is "Customer Products"
view: customer_products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_tmp.customer_products ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Comp ID" in Explore.

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_month {
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_month ;;
  }

  dimension_group: deleted_month {
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.deleted_month ;;
  }

  dimension: is_marijuana_product {
    type: yesno
    sql: ${TABLE}.is_marijuana_product ;;
  }

  dimension: products_count {
    hidden: yes
    type: number
    sql: ${TABLE}.products_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_products_count {
    type: sum
    sql: ${products_count} ;;
  }

  measure: mj_products_count {
    type: sum
    sql: ${products_count} ;;
    filters: [is_marijuana_product: "Yes"]
  }

  measure: non_mj_products_count {
    type: sum
    sql: ${products_count} ;;
    filters: [is_marijuana_product: "No"]
  }

  # measure: average_products_count {
  #   type: average
  #   sql: ${products_count} ;;
  # }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
