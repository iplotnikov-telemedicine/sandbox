# The name of this view in Looker is "Ca Turnover"
view: ca_turnover {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_tmp.ca_turnover ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Is Stiiizy Product" in Explore.

  dimension: is_stiiizy_product {
    type: yesno
    sql: ${TABLE}.is_stiiizy_product ;;
  }

  measure: is_selling_stiiizy {
    type: max
    sql: ${TABLE}.is_stiiizy_product ;;
  }

  dimension: report_year {
    type: number
    sql: ${TABLE}.report_year ;;
  }


  dimension: schema_name {
    type: string
    sql: ${TABLE}.schema_name ;;
  }

  dimension: turnover {
    type: number
    sql: ${TABLE}.turnover ;;
    value_format_name: usd_0
  }

  measure: count {
    type: count
    drill_fields: [schema_name]
  }

  measure: customers_count {
    type: count_distinct
    sql: ${TABLE}.schema_name ;;
  }

  measure: total_turnover {
    type: sum
    sql: ${TABLE}.turnover ;;
    value_format_name: usd_0
  }

  measure: average_turnover {
    type:  number
    sql: ${total_turnover} / ${customers_count};;
    value_format_name: usd_0
  }

}
