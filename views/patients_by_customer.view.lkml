# If necessary, uncomment the line below to include explore_source.
# include: "customer_sales.model.lkml"

view: patients_by_customer {
  derived_table: {
    explore_source: customer_patients {
      column: comp_id {}
      column: total_patients_count {}
      column: male_patients_count {}
      column: female_patients_count {}
      column: unspecified_patients_count {}
      filters: {
        field: customer_patients.deleted_month_month
        value: "NULL"
      }
    }
  }

  dimension: comp_id {
    hidden: yes
    type: number
  }

  dimension: total_patients_count {
    description: "# of consumers (patients) in total"
    type: number
  }

  dimension: total_patients_tier {
    type: tier
    tiers: [0,1000,3000,10000,30000,100000,200000]
    style: integer
    sql: ${total_patients_count} ;;
    # Bins: 0, 1-999, 1000-2999, 3000-9999, 10000-29999, 30000-99999, 100000-199999, >=200000
  }

  dimension: male_patients_count {
    description: "# of male patients"
    type: number
  }

  dimension: female_patients_count {
    description: "# of female patients"
    type: number
  }

  dimension: unspecified_patients_count {
    description: "# of patients with an unspecified gender"
    type: number
  }
}
