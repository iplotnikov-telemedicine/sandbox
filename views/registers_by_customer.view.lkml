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
  dimension: mobile_registers_count {
    description: "Number of Mobile Registers"
    type: number
  }
  dimension: tv_registers_count {
    description: "Number of TVs"
    type: number
  }
}
