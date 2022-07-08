# If necessary, uncomment the line below to include explore_source.
# include: "customer_sales.model.lkml"

view: registers_by_customer {
  derived_table: {
    explore_source: customer_registers {
      column: comp_id {}
      column: pos_registers_count {}
      column: mobile_registers_count {}
      column: tv_registers_count {}
    }
  }

  dimension: comp_id {
    hidden: yes
    type: number
  }

  dimension: pos_registers_count {
    description: "Number of POS"
    type: number
  }

  dimension: pos_registers_tier {
    type: tier
    tiers: [0,5,15,30,70,150,300,600,1000]
    style: integer
    sql: ${pos_registers_count} ;;
    # Bins: 0, 1-4, 5-14, 30-69, 70-149, 150-299, 300-599, 600-999, >=1000
  }

  dimension: mobile_registers_count {
    description: "Number of Mobile Registers"
    type: number
  }

  dimension: tv_registers_count {
    description: "Number of TVs"
    type: number
  }

}
