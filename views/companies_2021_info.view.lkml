# If necessary, uncomment the line below to include explore_source.
# include: "ca_companies.model.lkml"

view: companies_2021_info {
  derived_table: {
    explore_source: companies {
      column: schema_name { field: ca_turnover.schema_name }
      column: is_selling_stiiizy { field: ca_turnover.is_selling_stiiizy }
      column: turnover_by_company { field: ca_turnover.total_turnover }
      filters: {
        field: ca_turnover.report_year
        value: "2021"
      }
    }
  }

  dimension: schema_name {
    primary_key: yes
    description: ""
  }

  dimension: is_selling_stiiizy {
    description: ""
    type: yesno
  }

  dimension: turnover_by_company {
    description: ""
  }

  dimension: total_turnover_tier {
    type: tier
    tiers: [
      100000,
      1000000,
      5000000,
      15000000,
      30000000
      ]
    sql: ${turnover_by_company} ;;
    value_format: "$0.0,,\"M\""
    style: integer
  }

  measure: count {
    type: count
  }

  measure: average_turnover {
    type:  number
    sql: sum(${turnover_by_company}) / ${count};;
    value_format_name: usd_0
  }


}
