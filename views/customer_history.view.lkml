# If necessary, uncomment the line below to include explore_source.
# include: "customer_sales.model.lkml"

view: customer_history {
  derived_table: {
    explore_source: customer_sales_static {
      column: comp_id { field: customer_sales_static.comp_id }
      column: min_report_month { field: customer_sales_static.min_report_month }
      column: max_report_month { field: customer_sales_static.max_report_month }
      column: months_with_io { field: customer_sales_static.months_with_io }
      column: sweede_sales_offices_count { field: customer_sales_static.sweede_sales_offices_count }
    }
    # persist_for: "24 hours"
  }
  dimension: comp_id {
    hidden: yes
    type: number
  }
  dimension: min_report_month {
    description: "First month company has sales via IO"
    type: date
  }
  dimension: max_report_month {
    description: "Last month company has sales via IO"
    type: date
  }
  dimension: months_with_io {
    description: "Number of Months with IO"
    type: number
  }
  dimension: sweede_sales_offices_count {
    description: "Number of offices that accepted Sweede orders at some point"
    type: number
  }
}
