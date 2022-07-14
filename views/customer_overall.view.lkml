# If necessary, uncomment the line below to include explore_source.
# include: "customer_sales.model.lkml"

view: customer_overall {
  derived_table: {
    explore_source: customer_sales {
      column: max_report_month {}
    }
  }
  dimension: max_report_month {
    description: ""
    type: date_month
  }
}
