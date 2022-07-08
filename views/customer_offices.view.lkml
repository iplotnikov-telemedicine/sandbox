# If necessary, uncomment the line below to include explore_source.
# include: "customer_sales.model.lkml"

view: customer_offices {
  derived_table: {
    explore_source: customers {
      column: office_comp_id { field: offices.office_comp_id }
      column: ondemand_offices_count { field: offices.ondemand_offices_count }
      column: ondemand_storages_count { field: offices.ondemand_storages_count }
      column: ordinary_storages_count { field: offices.ordinary_storages_count }
      column: storefront_offices_count { field: offices.storefront_offices_count }
      column: sweede_accept_offices_count { field: offices.sweede_accept_offices_count }
      column: sweede_offices_count { field: offices.sweede_offices_count }
    }
    # persist_for: "24 hours"
  }

  dimension: office_comp_id {
    hidden: yes
    type: number
  }

  dimension: ondemand_offices_count {
    description: "On-demand office count"
    type: number
  }

  dimension: ondemand_offices_tier {
    type: tier
    tiers: [0,5,15,30,50,100,200,400,800,1600]
    style: integer
    sql: ${ondemand_offices_count} ;;
    # Bins: 1-4, 5-14, 15-29, 30-49, 50-99, 100-199, 200-399, 400-799, 800-1599, >=1600
  }

  dimension: ondemand_storages_count {
    description: "On-demand storage count"
    type: number
  }

  dimension: ondemand_storages_tier {
    type: tier
    tiers: [0,5,15,30,50,100,200,400,800,1600]
    style: integer
    sql: ${ondemand_storages_count} ;;
    # Bins: 1-4, 5-14, 15-29, 30-49, 50-99, 100-199, 200-399, 400-799, 800-1599, >=1600
  }

  dimension: ordinary_storages_count {
    description: "Storefront office storage count"
    type: number
  }

  dimension: ordinary_storages_tier {
    type: tier
    tiers: [0,5,15,30,50,100,200,400,800,1600]
    style: integer
    sql: ${ordinary_storages_count} ;;
    # Bins: 1-4, 5-14, 15-29, 30-49, 50-99, 100-199, 200-399, 400-799, 800-1599, >=1600
  }

  dimension: storefront_offices_count {
    description: "Storefront office count"
    type: number
  }

  dimension: storefront_offices_tier {
    type: tier
    tiers: [0,5,15,30,50,100,200,400,800,1600]
    style: integer
    sql: ${storefront_offices_count} ;;
    # Bins: 1-4, 5-14, 15-29, 30-49, 50-99, 100-199, 200-399, 400-799, 800-1599, >=1600
  }

  dimension: sweede_accept_offices_count {
    description: "# of Sweede office accepting orders now"
    type: number
  }

  dimension: sweede_offices_count {
    description: "Total Sweede office count"
    type: number
  }


}
