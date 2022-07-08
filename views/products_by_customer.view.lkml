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

  dimension: mj_products_tier {
    type: tier
    tiers: [0,1,500,1000,3000,5000,10000]
    style: integer
    sql: ${mj_products_count} ;;
    # Bins: 0, 1-499, 500-999, 1000-2999, 3000-4999, 5000-9999, >=10000
  }

  dimension: non_mj_products_count {
    description: "Non MJ product list size"
    type: number
  }

  dimension: non_mj_products_tier {
    type: tier
    tiers: [0,1,500,1000,3000,5000,10000]
    style: integer
    sql: ${non_mj_products_count} ;;
    # Bins: 0, 1-499, 500-999, 1000-2999, 3000-4999, 5000-9999, >=10000
  }

  dimension: total_products_count {
    description: "Total product list size"
    type: number
  }

  dimension: total_products_tier {
    type: tier
    tiers: [0,1,500,1000,3000,5000,10000]
    style: integer
    sql: ${total_products_count} ;;
    # Bins: 0, 1-499, 500-999, 1000-2999, 3000-4999, 5000-9999, >=10000
  }

  dimension: comp_id {
    hidden: yes
    description: ""
    type: number
  }

}
