# The name of this view in Looker is "Customer Registers"
view: customer_registers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_tmp.customer_registers ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Comp ID" in Explore.

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: registers_count {
    type: number
    sql: ${TABLE}.registers_count ;;
  }

  measure: total_registers_count {
    type: sum
    sql: ${registers_count} ;;
  }

  measure: pos_registers_count {
    type: sum
    sql: ${registers_count} ;;
    filters: [register_type: "POS"]
  }

  measure: mobile_registers_count {
    type: sum
    sql: ${registers_count} ;;
    filters: [register_type: "Mobile"]
  }

  measure: tv_registers_count {
    type: sum
    sql: ${registers_count} ;;
    filters: [register_type: "TV"]
  }

  dimension: type_id {
    hidden: yes
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension: register_type {
    type: string
    case: {
      when: {
        sql: ${TABLE}.type_id = 1 ;;
        label: "POS"
      }
      when: {
        sql: ${TABLE}.type_id = 2 ;;
        label: "Mobile"
      }
      when: {
        sql: ${TABLE}.type_id = 3 ;;
        label: "TV"
      }
    }
  }
}
