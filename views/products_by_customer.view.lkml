# If necessary, uncomment the line below to include explore_source.
# include: "customer_sales.model.lkml"

view: products_by_customer {
  derived_table: {
    explore_source: customer_products {
      column: mj_products_count {}
      column: non_mj_products_count {}
      column: total_products_count {}
      column: comp_id {}
      filters: {
        field: customer_products.deleted_month_month
        value: "NULL"
      }
    }
  }
  dimension: mj_products_count {
    description: "MJ product list size"
    type: number
  }
  dimension: non_mj_products_count {
    description: "Non MJ product list size"
    type: number
  }
  dimension: total_products_count {
    description: "Total product list size"
    type: number
  }
  dimension: comp_id {
    hidden: yes
    description: ""
    type: number
  }
}
