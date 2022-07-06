# The name of this view in Looker is "Customer Patients"
view: customer_patients {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_tmp.customer_patients ;;
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

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  measure: male_patients_count {
    type: sum
    sql: ${patients_count} ;;
    filters: [gender: "Male"]
  }

  measure: female_patients_count {
    type: sum
    sql: ${patients_count} ;;
    filters: [gender: "Female"]
  }

  measure: unspecified_patients_count {
    type: sum
    sql: ${patients_count} ;;
    filters: [gender: "Unspecified"]
  }

  dimension: patients_count {
    hidden: yes
    type: number
    sql: ${TABLE}.patients_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_patients_count {
    type: sum
    sql: ${patients_count} ;;
  }

  # measure: average_patients_count {
  #   type: average
  #   sql: ${patients_count} ;;
  # }

#   --     public const MEDICAL_WITH_REC        = 1;
# --     public const RECREATIONAL            = 2;
# --     public const MEDICAL_WITH_STATE_CARD = 3;
# --     public const MEDICAL                 = 4;
# --     public const ADULT                   = 5;
# --     public const MINOR                   = 6;
# --     public const TEMPORARY_ADULT         = 7;
# --     public const TEMPORARY_MINOR         = 8;
# --     public const CAREGIVER               = 9;

  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension: type_name {
    type: number
    case: {
      when: {
        sql: ${TABLE}.type_id = 1 ;;
        label: "MEDICAL_WITH_REC"
      }
      when: {
        sql: ${TABLE}.type_id = 2 ;;
        label: "RECREATIONAL"
      }
      when: {
        sql: ${TABLE}.type_id = 3 ;;
        label: "MEDICAL_WITH_STATE_CARD"
      }
      when: {
        sql: ${TABLE}.type_id = 4 ;;
        label: "MEDICAL"
      }
      when: {
        sql: ${TABLE}.type_id = 5 ;;
        label: "ADULT"
      }
      when: {
        sql: ${TABLE}.type_id = 6 ;;
        label: "MINOR"
      }
      when: {
        sql: ${TABLE}.type_id = 7 ;;
        label: "TEMPORARY_ADULT"
      }
      when: {
        sql: ${TABLE}.type_id = 8 ;;
        label: "TEMPORARY_MINOR"
      }
      when: {
        sql: ${TABLE}.type_id = 9 ;;
        label: "CAREGIVER"
      }
    }
  }

}
